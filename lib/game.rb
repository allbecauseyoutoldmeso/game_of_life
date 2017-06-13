class Game

  attr_reader :grid, :size

  def initialize(grid)
    @grid = grid
    @size = grid.length
  end

  def neighbours(cell)
    cell_neighbours = []
    row = grid.flatten.index(cell)/size
    column = grid.flatten.index(cell) % size

    unless row == 0
      cell_neighbours.push grid[row-1][column-1] unless column == 0
      cell_neighbours.push grid[row-1][column]
      cell_neighbours.push grid[row-1][column+1] unless column == size-1
    end

    cell_neighbours.push grid[row][column-1] unless column == 0
    cell_neighbours.push grid[row][column+1] unless column == size-1

    unless row == size-1      
      cell_neighbours.push grid[row+1][column-1] unless column == 0
      cell_neighbours.push grid[row+1][column]
      cell_neighbours.push grid[row+1][column+1] unless column == size-1
    end

    cell_neighbours
  end

  def number_live(cell)
    neighbours(cell).select { |neighbour| neighbour.live? }.length
  end

  def tick
  end

end
