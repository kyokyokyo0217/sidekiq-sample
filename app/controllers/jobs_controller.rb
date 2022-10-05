class JobsController < ApplicationController
  def index; end

  def create
    HardJob.perform_async(params[:job_name], Date.parse(params[:datetime]))
  end
end
