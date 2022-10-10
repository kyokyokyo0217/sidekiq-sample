class HardJob
  include Sidekiq::Job

  def perform(*args)
    p(*args)
  end
end
