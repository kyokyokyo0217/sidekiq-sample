class LoggerJob < ApplicationJob
  queue_as :default

  def perform(job_name)
    logger.info "Logger Job Performed! Name: #{job_name}"
  end
end
