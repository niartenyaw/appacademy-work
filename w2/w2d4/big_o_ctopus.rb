def sluggish_octopus(fishies)
  largest = ""

  fishies.each do |fish|
    fishies.each do |other|
      largest = fish if fish.length - other.length > longest.length - other.length
    end
  end

  largest
end

def dominant_octopus(fishies)
  fishies.merge_sort.last
end

class Array
  def merge_sort(arr)
    return arr if length == 1

    middle = length / 2

    left = dup.take(middle).merge_sort
    right = dup.drop(middle).merge_sort

    Array.merge(left, right)
  end

  private
  
  def self.merge(left, right)
    sorted = []

    until left.empty? || right.empty?
      if left.first.length > right.first.length
        sorted << right.shift
      else
        sorted << left.shift
      end
    end
    sorted + left + right
  end
end


def clever_octopus(fishies)
  longest = ""
  fishies.each { |f| longest = f if f.length > longest.length }
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  arr.each_with_index do |move, i|
    return i if dir == move
  end
end


tiles_hash = {
  "up"  => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end
