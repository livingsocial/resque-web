class FailuresController < ApplicationController
  include FailuresHelper

  def show
    @jobs = []

    # FIXME: a better API for obtaining failures would be nice here
    Resque::Failure.each(failure_start_at, failure_per_page, params[:id], params[:class]) do |id, job|
      @jobs << [id, job]
    end
  end
end
