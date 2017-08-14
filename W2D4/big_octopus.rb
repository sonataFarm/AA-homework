

def sluggish_octopus(fish)
  fish = fish.dup

  loop do
    this_fish = fish.first
    longest = true

    fish.drop(1).each do |other_fish|
      if other_fish.length > this_fish.length
        longest = false
      end
    end

    return this_fish if longest

    fish.rotate!
  end
end

def dominant_octopus(fish)
  merge_sort_octopus(fish)[-1]
end

def merge_sort_octopus(fish)
  return fish if fish.count < 2

  mid = fish.length / 2
  left_fish = merge_sort_octopus(fish.take(mid))
  right_fish = merge_sort_octopus(fish.drop(mid))

  merge_octopus(left_fish, right_fish)
end

def merge_octopus(left_fish, right_fish)
  merged = []

  until left_fish.empty? || right_fish.empty?
    if left_fish.first.length < right_fish.first.length
      to_merge = left_fish.shift
    else
      to_merge = right_fish.shift
    end

    merged << to_merge
  end

  merged + left_fish + right_fish
end

def clever_octopus(fish)
  max_fish = fish.first
  fish.drop(1).each do |fish|
    max_fish = fish if fish.length > max_fish.length
  end

  max_fish
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
puts sluggish_octopus(fish)
puts dominant_octopus(fish)
puts clever_octopus(fish)

def slow_dance(target, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == target
  end
end

def fast_dance(target, tiles_hash)
  tiles_hash[target]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

puts slow_dance("up", tiles_array) == 0
puts slow_dance("right-down", tiles_array) == 3

tiles_hash = tiles_array.each_with_index.reduce({}) do |hash, (tile, idx)|
  hash[tile] = idx
  hash
end

puts fast_dance("up", tiles_hash) == 0
puts fast_dance("right-down", tiles_hash) == 3
