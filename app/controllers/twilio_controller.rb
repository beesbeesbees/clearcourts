class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token
  before_filter :verify_account

  def sms
    @session= Session.where(phone_number: twilio_params[:From]).first_or_initialize
    #@session.state
    render nothing: true, status: 200, :content_type => 'application/json'.freeze
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
end
