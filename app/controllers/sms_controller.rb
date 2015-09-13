class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token #no web form token

  def greeting_1
    @session= Session.where(phone_number: params[:From]).first_or_initialize
    @session.update!(
      phone_number: params[:From], #create a session
      state: 'greeting_3'.freeze, #next state
    )
    render partial: 'greeting_1'.freeze, locals: {body: @body}#, session: @session}
  end

  def greeting_3
    get_session
    if body.to_s.length> 0
      @session.update(first_name: body.to_s)
      next_state 'greeting_4'.freeze
      render partial: 'greeting_3'.freeze, locals: {body: @body, session: @session, done: true}
    else
      next_state 'greeting_3'.freeze
      render partial: 'greeting_3'.freeze, locals: {body: @body, session: @session, done: false}
    end
  end

  def greeting_4
    get_session
    if ['IPHONE', 'ANDROID'].include? body.upcase
      @session.update(phone_type: body.upcase)
      next_state 'greeting_5'.freeze
      render partial: 'greeting_4'.freeze, locals: {body: @body, session: @session, done: true}
    else
      @session.update(phone_type: 'OTHER')
      next_state 'greeting_5'.freeze
      render partial: 'greeting_4'.freeze, locals: {body: @body, session: @session, done: true}
    end
  end

  def greeting_5
    get_session
    if body.to_s=~ /[^0123456789]/
      @session.update(citation_number: body.to_s)
      next_state 'greeting_6'.freeze
      render partial: 'greeting_5'.freeze, locals: {body: @body, session: @session, done: true}
    else
      if body.to_s.length> 0
        @session.update(last_name: body.to_s)
        next_state 'greeting_6'.freeze
        render partial: 'greeting_5'.freeze, locals: {body: @body, session: @session, done: true}
      else
        next_state 'greeting_5'.freeze
        render partial: 'greeting_5'.freeze, locals: {body: @body, session: @session, done: false}
      end
    end
  end

  def greeting_6
    get_session
    if body.to_s=~ /^[1-3][0-9][0-9][0-9]$/
      @session.update(birth_year: body.to_s.to_i)
      next_state 'greeting_7'.freeze
      render partial: 'greeting_6'.freeze, locals: {body: @body, session: @session, done: true}
    else
      next_state 'greeting_6'.freeze
      render partial: 'greeting_6'.freeze, locals: {body: @body, session: @session, done: false}
    end
  end

  def greeting_7
    get_session
    if body.to_s=~ /^[0-1][0-9]$/
      @session.update(birth_month: body.to_s.to_i)
      next_state 'citation_2'.freeze
      render partial: 'greeting_7'.freeze, locals: {body: @body, session: @session, done: true}
    else
      next_state 'greeting_7'.freeze
      render partial: 'greeting_7'.freeze, locals: {body: @body, session: @session, done: false}
    end
  end

  def citation_1
    get_session
    if (body.to_s.length> 0) && @session.update(citation_number: body.to_s.to_i)
      if Citation.where(citation_number: body).count> 0
        next_state 'citation_2'.freeze
        render partial: 'citation_1'.freeze, locals: {body: @body, session: @session, done: true, citations: Citation.where(citation_number: body)}
      else
        next_state 'restart_1'.freeze
        render partial: 'citation_1'.freeze, locals: {body: @body, session: @session, done: true, citations: Citation.none}
      end
    else
      next_state 'citation_2'.freeze
      render partial: 'citation_1'.freeze, locals: {body: @body, session: @session, done: false}
    end
  end

  def citation_2
    get_session
    if body.to_s=~ /^[0-3][0-9]$/
      @session.update(birth_day: body.to_s.to_i)
      next_state 'citation_3'.freeze
      render partial: 'citation_2'.freeze, locals: {body: @body, session: @session, done: true}
    else
      next_state 'citation_2'.freeze
      render partial: 'citation_2'.freeze, locals: {body: @body, session: @session, done: false}
    end
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
