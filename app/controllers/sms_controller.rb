class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token

  def greeting_1
Rails.logger.debug "params== #{params}"
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    @session.update!(stage: 'greeting_3'.freeze) #next stage
    render partial: 'greeting_1'.freeze
  end

  def greeting_3
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    @session.update!(stage: 'greeting_1'.freeze) #next stage
    render partial: 'greeting_3'.freeze
  end

  def greeting_4

  end

  def greeting_5

  end

  def greeting_6

  end

  def greeting_7

  end
end
