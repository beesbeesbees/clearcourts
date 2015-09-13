module GarbageCollector
  def self.take_out_trash
    GarbageCollector::Session.new.scrub
  end
end
