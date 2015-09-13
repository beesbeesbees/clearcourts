class GarbageCollector::Session < Object
  def scrub
    clean_sms_sessions
    clean_web_sessions
  end

private

  def clean_web_sessions
    # WEB_SESSION_TIMEOUT_SECONDS
    true
  end

  def clean_sms_sessions
    ::Session.connection.execute <<-"SQL"
      DELETE
      FROM `sessions`
      WHERE `phone_number` IS NOT NULL
      AND `updated_at` <
        (NOW() - INTERVAL #{::Session::SMS_SESSION_TIMEOUT_SECONDS} SECOND);
    SQL
  end
end
