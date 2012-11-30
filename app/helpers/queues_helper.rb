module QueuesHelper
  def queue_names
    Resque.queues.sort_by(&:to_s)
  end

  def queue_start_at
    params[:start].to_i
  end

  def queue_end_at
    if queue_start_at + queue_per_page > queue_size
      queue_size
    else
      queue_start_at + queue_per_page
    end
  end

  def queue_per_page
    20
  end

  def queue_size(queue_name = params[:id])
    Resque.size queue_name
  end

  def queue_jobs
    @queue_jobs ||= Resque.peek(params[:id], queue_start_at, queue_per_page)
  end

  def failed_queue_names
    Resque::Failure.queues.sort_by(&:to_s)
  end

  def failed_queue_class(queue_name)
    Resque::Failure.count(queue_name).zero? ? "failed" : "failure"
  end

  def failed_queue_size(queue_name)
    Resque::Failure.count(queue_name)
  end
end
