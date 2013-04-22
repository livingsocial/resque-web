class FailuresController < ApplicationController

  # Display all jobs in the failure queue
  #
  # @param [Hash] params
  # @option params [String] :class filters failures shown by class
  # @option params [String] :queue filters failures shown by failure queue name
  def index
  end

  # remove an individual job from the failure queue
  def destroy
    Resque::Failure.remove(params[:id])
    redirect_to failures_path(redirect_params)
  end

  # destroy all jobs from the failure queue
  def destroy_all
    queue = params[:queue] || 'failed'
    Resque::Failure.clear(queue)
    redirect_to failures_path(redirect_params)
  end

  # retry an individual job from the failure queue
  def retry
    Resque::Failure.requeue(params[:id])
    redirect_to failures_path(redirect_params)
  end

  # retry all jobs from the failure queue
  def retry_all
    if params[:queue].present? && params[:queue]!="failed"
      Resque::Failure.requeue_queue(params[:queue])
    else
      (0...Resque::Failure.count).each { |id| Resque::Failure.requeue(id) }
    end
    redirect_to failures_path(redirect_params)
  end

  private

  def redirect_params
    {}.tap do |p|
      if params[:queue].present?
        p[:queue] = params[:queue]
      end
    end
  end

end
