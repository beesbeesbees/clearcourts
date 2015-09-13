class SmsWorker < Object
  include Sidekiq::Worker

  def initialize
    @pots= TwilioClient.new
  end

  def perform to= ''.freeze, body= ''.freeze
    if @pots.send_sms to: to, body: body
      true
    else
      raise 'Cannot send SMS'.freeze
    end
  end

end
