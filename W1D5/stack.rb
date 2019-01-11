class Stack
  attr_reader :result_arr

  def initialize
    @result_arr = []
  end

  def push(el)
    result_arr.push(el)
    el
  end

  def pop
    result_arr.pop
  end

  def peek
    result_arr.last
  end
end
