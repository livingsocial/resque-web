class JobsController < ApplicationController
  def destroy
    Resque::Failure.remove(params[:id])
    redirect_to failures_path(:queue => params[:failure_id])
  end
end
