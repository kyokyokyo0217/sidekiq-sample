class JobsController < ApplicationController
  def index
    p 'hoge'
  end

  def create
    p 'queueing job...'
    HardJob.perform_async('bob', 5)
    p 'queued!'
  end
end
