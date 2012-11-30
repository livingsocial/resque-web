class QueuesController < ApplicationController
  def show
    set_subtabs view_context.queue_names
  end
end
