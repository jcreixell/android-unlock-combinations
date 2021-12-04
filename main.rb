COLS = 3
ROWS = 3
MINIMUM_PATTERN_SIZE = 4

$count = 0
$counts_by_size = {}

def is_within_bounds(x, y)
  (x >= 0 && x < COLS) && (y >=0 && y < ROWS)
end

def is_visited(visited, x, y)
  visited.include?([x,y])
end

def move(visited, x, y)
  return if !is_within_bounds(x, y) || is_visited(visited, x, y)
  
  unless (visited.length + 1) < MINIMUM_PATTERN_SIZE
  $count = $count +  1
  $counts_by_size[visited.length+1] = $counts_by_size[visited.length+1] == nil ? 1 : $counts_by_size[visited.length+1] + 1 
  puts "#{visited + [[x, y]]}"
  end

  # Horizontal
  move(visited + [[x,y]], x-1, y)
  move(visited + [[x,y]], x+1, y)

  move(visited + [[x,y]], x-2, y) if visited.include?([x-1,y])
  move(visited + [[x,y]], x+2, y) if visited.include?([x+1,y])

  # Vertical
  move(visited + [[x,y]], x, y-1)
  move(visited + [[x,y]], x, y+1)

  move(visited + [[x,y]], x, y-2) if visited.include?([x,y-1])
  move(visited + [[x,y]], x, y+2) if visited.include?([x,y+1])

  # Diagonals
  move(visited + [[x,y]], x+1, y+1)
  move(visited + [[x,y]], x-1, y+1)
  move(visited + [[x,y]], x+1, y-1)
  move(visited + [[x,y]], x-1, y-1)

  move(visited + [[x,y]], x+2, y+2) if visited.include?([x+1,y+1])
  move(visited + [[x,y]], x-2, y+2) if visited.include?([x-1,y+1])
  move(visited + [[x,y]], x+2, y-2) if visited.include?([x+1,y-1])
  move(visited + [[x,y]], x-2, y-2) if visited.include?([x-1,y-1])
end

(0..2).each do |x|
  (0..2).each do |y|
    move([], x, y)
  end
end

puts $count
puts $counts_by_size
