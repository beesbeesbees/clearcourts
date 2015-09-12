class SmsWorker::TwilioClient < Object
  require 'twilio-ruby'
  def initialize
    account_sid= ENV['TWILIO_ACCOUNT_SID'.freeze]
    account_token= ENV['TWILIO_ACCOUNT_TOKEN'.freeze]
    @account= Twilio::REST::Client.new(account_sid, account_token).account
  end

  def send_sms to:, body:
    begin
      @account.messages.create(
        from: ENV['CLEARCOURTS_PHONE_NUMBER'.freeze],
        to: to,
        body: body,
      ).!.!
    rescue Twilio::REST::RequestError => e
      Rails.logger.error e.message
      false
    end
  end
end
