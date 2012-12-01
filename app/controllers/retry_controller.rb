class RetryController < ApplicationController
  def create
    Resque::Failure.requeue_queue Resque::Failure.job_queue_name(params[:failure_id])
    redirect_to failure_path(params[:failure_id])
  end
end
