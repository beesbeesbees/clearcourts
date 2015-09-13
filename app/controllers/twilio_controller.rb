class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token
  before_filter :verify_account

  def sms
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    SmsWorker.perform_in(2.seconds,
      twilio_params[:From],  #send the text to the number we received this one from
      'f'<< render_action_to_s(SmsController, @session.next_action, twilio_params).to_s #render the view into the SMS body
    )
    render nothing: true, status: 200, :content_type => 'application/json'
  end

private
  def verify_account
    raise 'Invalid Twilio account'.freeze unless (
      twilio_params[:AccountSid]== ENV['TWILIO_ACCOUNT_SID'.freeze]
    )
  end

  def twilio_params
    @cached_twilio_params||= params.permit(
      :ToCountry, :ToState, :SmsMessageSid, :NumMedia, :ToCity,
      :FromZip, :SmsSid, :FromState, :SmsStatus, :FromCity, :Body,
      :FromCountry, :To, :ToZip, :NumSegments, :MessageSid,
      :AccountSid, :From, :ApiVersion
    )
  end

  def render_action_to_s(controller, action, params)
    controller.class_eval do
      def params=(params)
        @params= params
      end
      def params
        @params
      end
    end
    instance= controller.new
    instance.request= @_request
    instance.response= @_response
    instance.params= params.dup
    #instance.process_action(action)
    instance.send(action)
    instance.response.body
  end
end
