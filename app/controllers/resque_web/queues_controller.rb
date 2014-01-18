module ResqueWeb
  class QueuesController < ApplicationController

    def index
    end

    def show
      set_subtabs view_context.queue_names
    end

    def destroy
      Resque.remove_queue(params[:id])
      redirect_to queues_path
    end

  end
end
