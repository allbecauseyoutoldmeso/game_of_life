class Game

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def neighbours(cell)
    row = @grid.flatten.index(cell)/(@grid.length)
    column = @grid.flatten.index(cell) % @grid.length
    [@grid[row][column-1], @grid[row][column+1], @grid[row-1][column], @grid[row+1][column]]
  end

  def tick
  end

end
