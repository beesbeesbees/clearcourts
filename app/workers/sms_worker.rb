class SmsWorker < Object
  include Sidekiq::Worker

  def initialize
    @pots= TwilioClient.new
  end

  def perform to:, body:
    @pots.send_sms to: to, body: body
  end

end
