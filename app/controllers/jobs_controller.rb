class JobsController < ApplicationController
  DAYS_PREVIOUS = 10

  def index
    @scheduled_jobs = Sidekiq::ScheduledSet.new
    histories = Sidekiq::Stats::History.new(DAYS_PREVIOUS)
    @histories_processed = histories.processed
    @histories_failed = histories.failed
  end

  def create
    # Add to Scheduled Queue
    LoggerJob.set(wait_until: Time.parse(params[:datetime])).perform_later(params[:name])
  end
end
