class LoggerJob < ApplicationJob
  queue_as :default

  def perform(params)
    logger.info "Logger Job Performed! Name: #{params[:name]}"
  end
end
