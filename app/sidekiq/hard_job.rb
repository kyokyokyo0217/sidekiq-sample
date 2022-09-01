class HardJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    p(*args)
  end
end
