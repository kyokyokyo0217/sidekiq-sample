class JobsController < ApplicationController
  def index
    @scheduled_jobs = Sidekiq::ScheduledSet.new
  end

  def create
    # Add to Scheduled Queue
    LoggerJob.set(wait_until: Time.parse(params[:datetime])).perform_later(params[:name])
  end
end
