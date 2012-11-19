module QueuesHelper
  def queue_names
    Resque.queues.sort_by { |q| q.to_s }
  end

  def queue_size(queue_name)
    Resque.size queue_name
  end

  def failed_queue_names
    Resque::Failure.queues.sort_by { |q| q.to_s }
  end

  def failed_queue_class(queue_name)
    Resque::Failure.count(queue_name).zero? ? "failed" : "failure"
  end

  def failed_queue_size(queue_name)
    Resque::Failure.count(queue_name)
  end
end
