class GarbageCollector < Object
  def initialize
  end

  def take_out_trash
    GarbageCollector::Session.scrub
  end
end
