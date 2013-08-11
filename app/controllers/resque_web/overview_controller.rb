module ResqueWeb
  class OverviewController < ApplicationController
    def show
      render :layout => !request.xhr?, :locals => { :polling => request.xhr? }
    end
  end
end
