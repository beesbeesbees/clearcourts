module GarbageCollector::Session
  def scrub
    clean_sms_sessions
    clean_web_sessions
  end

private

  def clean_web_sessions
    true
  end

  def clean_sms_sessions
    #Session.destroy_all(~query_details~) # N+1 queries
    Session.connection.execute <<-SQL
      DELETE
      FROM `sessions`
      WHERE `phone_number` IS NOT NULL
      AND (UNIX_TIMESTAMP() - UNIX_TIMESTAMP(`updated_at`)
        ) > (60 * 60)  /* 60 minutes */;
    SQL
  end
end
