class FailuresController < ApplicationController
  def show
    if params[:class]
      start_at, end_at = 0, Resque::Failure.count(params[:id])
    else
      start_at, end_at = view_context.failure_start_at, view_context.failure_end_at
    end

    @jobs = Resque::Failure.all(start_at, end_at, params[:id]).map.with_index { |j, i| [i, j] }

    if params[:class]
      @jobs.delete_if do |_, job|
        next false unless job['payload'] && job['payload']['class']
        job['payload']['class'].downcase != params[:class].downcase
      end

      @jobs[view_context.failure_start_at..view_context.failure_end_at]
    end
  end

  def destroy
    Resque::Failure.clear params[:id]
    redirect_to failure_path
  end
end
