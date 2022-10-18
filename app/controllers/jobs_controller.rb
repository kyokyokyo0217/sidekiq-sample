class JobsController < ApplicationController
  def index; end

  def create
    LoggerJob.set(wait_until: Time.parse(params[:datetime])).perform_later(params[:name])
  end
end
