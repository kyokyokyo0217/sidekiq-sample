class JobsController < ApplicationController
  DAYS_PREVIOUS = 10

  def index
    @enqueued_jobs = Sidekiq::Queue.new
    @scheduled_jobs = Sidekiq::ScheduledSet.new
    histories = Sidekiq::Stats::History.new(DAYS_PREVIOUS)
    @histories_processed = histories.processed
    @histories_failed = histories.failed
  end

  def create
    if params[:datetime].present?
      puts params[:name]
      LoggerJob.set(wait_until: Time.parse(params[:datetime])).perform_later(params[:name])
    else
      LoggerJob.perform_later(params[:name])
    end
  end
end
