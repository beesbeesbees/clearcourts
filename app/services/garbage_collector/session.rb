module GarbageCollector::Session
  class<< self
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
        AND `updated_at` <
          (NOW() - INTERVAL 3600 SECOND);
      SQL
    end
  end
end
