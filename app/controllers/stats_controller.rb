class StatsController < ApplicationController
  def index
    redirect_to :action => 'resque'
  end
end
