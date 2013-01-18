class RetryController < ApplicationController
  def create
    if params[:failure_id] == 'all'
      if Resque::Failure.backend == Resque::Failure::Redis
        (0...Resque::Failure.count).each { |id| Resque::Failure.requeue(id) }
      elsif Resque::Failure.backend == Resque::Failure::RedisMultiQueue
        Resque::Failure.queues.each do |queue|
          Resque::Failure.requeue_queue(Resque::Failure.job_queue_name(queue))
        end
      else raise "unsupported failure backend: #{Resque::Failure.backend}"
      end

      redirect_to failures_path
    else
      Resque::Failure.requeue_queue Resque::Failure.job_queue_name(params[:failure_id])
      redirect_to failure_path(params[:failure_id])
    end
  end
end
