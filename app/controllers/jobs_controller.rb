class JobsController < ApplicationController
  def index; end

  def create
    LoggerJob.perform_now(params)
  end
end
