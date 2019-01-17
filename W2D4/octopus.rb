# Sluggish Octopus - find longest fish in O(n^2) time; quadratic
def sluggish_octopus(fish_arr)
  fish_arr.each_with_index do |fish1, i1|
    max_length = true

    fish_arr.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end

end

# Dominant Octopus - find longest fish in O(n log n) time; nlogn
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return self if count <= 1
    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end
    result + left + right
  end
end

# Dominant Octopus implementation
def nlogn_biggest_fish(fish_arr)
  prc = Proc.new { |x, y| y.length <=> x.length }  # sort longest to shortest
  fish_arr.merge_sort(&prc)[0] #return the first element
end

# Clever octopus - find longest fish in O(n) time; linear
def clever_octopus(fish_arr)
  biggest_fish = fish_arr.first

  fish_arr.each do |fish|
    if fish.length > biggest_fish.length  #update the biggest fish
      biggest_fish = fish
    end
  end
  biggest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]

# Slow Dance -- takes O(n) time; linear
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

# Fash Dance -- takes O(1) time; constant
def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
