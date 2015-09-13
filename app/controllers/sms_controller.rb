class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token

  def greeting_1
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    @session.update!(
      phone_number: params['From'.freeze],
      state: 'greeting_3'.freeze, #next state
    )
    render partial: 'greeting_1'.freeze
  end

  def greeting_3
    get_session
    next_state 'greeting_4'.freeze
    render partial: 'greeting_3'.freeze
  end

  def greeting_4
    get_session
    next_state 'greeting_5'.freeze
    render partial: 'greeting_4'.freeze
  end

  def greeting_5
    get_session
    next_state 'greeting_6'.freeze
    render partial: 'greeting_5'.freeze
  end

  def greeting_6
    get_session
    next_state 'greeting_7'.freeze
    render partial: 'greeting_6'.freeze
  end

  def greeting_7
    get_session
    next_state 'greeting_1'.freeze
    render partial: 'greeting_7'.freeze
  end

private

  def get_session
    @session= Session.where(phone_number: params[:From]).first
  end

  def next_state state
    @session.update!(state: state)
  end
end
