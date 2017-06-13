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
      push_cells(row-1, column, cell_neighbours)
    end

    cell_neighbours.push grid[row][column-1] unless column == 0
    cell_neighbours.push grid[row][column+1] unless column == size-1

    unless row == size-1
      push_cells(row+1, column, cell_neighbours)
    end

    cell_neighbours
  end

  def push_cells(row, column, array)
    array.push grid[row][column-1] unless column == 0
    array.push grid[row][column]
    array.push grid[row][column+1] unless column == size-1
  end

  def number_live(cell)
    neighbours(cell).select { |neighbour| neighbour.live? }.length
  end

  def tick
  end

end
