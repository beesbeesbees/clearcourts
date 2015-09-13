class GarbageCollectorWorker < Object
  include Sidekiq::Worker

  def perform
    GarbageCollector.new.take_out_trash
    respawn if respawn_needed?
  end

private

  def respawn_needed?
    true
  end

  def respawn
    self.class.perform_in 4.minutes
  end
end
