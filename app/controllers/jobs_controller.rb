class JobsController < ApplicationController

  def destroy
    Resque::Failure.remove(params[:id])
    redirect_to failures_path(failures_params)
  end

  def retry
    Resque::Failure.requeue(params[:id])
    redirect_to failures_path(failures_params)
  end

  private

  def failures_params
    {}.tap do |failures_params|
      if params[:failure_id].present?
        failures_params[:queue] = params[:failures_id]
      end
    end
  end

end
