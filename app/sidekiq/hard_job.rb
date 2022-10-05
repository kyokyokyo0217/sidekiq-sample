class HardJob
  include Sidekiq::Job

  def perform(*args)
    redis = Redis.new
    redis.set('mykey', 'hello world')
    p(*args)
  end
end
