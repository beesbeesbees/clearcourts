class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token

  def greeting_1
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    @session.update!(
      phone_number: params[:From], #create a session
      state: 'greeting_3'.freeze, #next state
    )
    render partial: 'greeting_1'.freeze, locals: {body: @body}
  end

  def greeting_3
    get_session
    if body=~ /0123456789/
      next_state 'greeting_4'.freeze
      render partial: 'greeting_3'.freeze, locals: {body: @body}
    else
      next_state 'greeting_6'.freeze
      render partial: 'greeting_3'.freeze, locals: {body: @body}
    end
  end

  def greeting_4
    get_session
    next_state 'greeting_5'.freeze
    render partial: 'greeting_4'.freeze, locals: {body: @body}
  end

  def greeting_5
    get_session
    next_state 'greeting_6'.freeze
    render partial: 'greeting_5'.freeze, locals: {body: @body}
  end

  def greeting_6
    get_session
    next_state 'greeting_7'.freeze
    render partial: 'greeting_6'.freeze, locals: {body: @body}
  end

  def greeting_7
    get_session
    next_state 'greeting_1'.freeze
    render partial: 'greeting_7'.freeze, locals: {body: @body}
  end

private

  def get_session
    body #set cache
    @session= Session.where(phone_number: params[:From]).first
  end

  def next_state state
    @session.update!(state: state)
  end

  def body
    @body||= params[:Body]
  end
end
