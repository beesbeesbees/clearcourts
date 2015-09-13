class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token
  before_filter :set_session

  def greeting_1
    @session.update!(stage: 'greeting_3'.freeze) #next stage
    render partial: 'greeting_1'.freeze
  end

  def greeting_3
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

private

  def set_session
    @session= Session.where(phone_number: params[:From]).first_or_initialize
  end
end
