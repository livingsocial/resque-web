class JobsController < ApplicationController
  def destroy
    Resque::Failure.remove(params[:index])
    redirect_to failure_path
  end
end
