class StatsController < ApplicationController
  subtabs :resque, :redis, :keys
  
  def index
    redirect_to :action => 'resque'
  end
end
