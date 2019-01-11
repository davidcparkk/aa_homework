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

class Map
  attr_reader :result_arr

  def initialize
    @result_arr = []
  end

  def set(key,val)
    pair_idx = result_arr.index do |pair|
      pair[0] == key
    end

    if pair_idx
      result_arr[pair_idx][1] = val
    else
      result_arr.push([key,val])
    end
    val
  end

  def get(key)
    result_arr.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def delete(key)
    value = get(key)
    result_arr.reject! {|pair| pair[0] == key}
    value
  end

  def show
    deep_dup(result_arr)
  end

  private

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end
end
