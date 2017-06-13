class Game

  attr_reader :grid, :size

  def initialize(grid)
    @grid = grid
    @size = grid.length
  end

  def neighbours(cell)
    row = grid.flatten.index(cell)/size
    column = grid.flatten.index(cell) % size
    [grid[row][column-1], grid[row][column+1], grid[row-1][column], grid[row+1][column]]
  end

  def number_live(cell)

  end

  def tick
  end

end
