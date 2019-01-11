class Queue
  attr_reader :result_arr

  def initialize
    @result_arr = []
  end

  def enqueue(el)
    result_arr.push(el)
    el
  end

  def dequeue
    result_arr.shift
  end

  def peek
    result_arr.first
  end
end
