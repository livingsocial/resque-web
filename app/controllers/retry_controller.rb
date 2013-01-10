class RetryController < ApplicationController
  def create
    if params[:failure_id] == 'all'
      Resque::Failure.queues.each { |queue| Resque::Failure.requeue_queue(queue) }
      redirect_to failures_path
    else
      Resque::Failure.requeue_queue Resque::Failure.job_queue_name(params[:failure_id])
      redirect_to failure_path(params[:failure_id])
    end
  end
end
