class JobsController < ApplicationController
  def index; end

  def create
    HardJob.perform_async(permitted_params[:job_name], Date.parse(permitted_params[:datetime]))
  end
end
