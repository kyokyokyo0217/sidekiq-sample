class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    p 'GuestsCleanupJob performed'
  end
end
