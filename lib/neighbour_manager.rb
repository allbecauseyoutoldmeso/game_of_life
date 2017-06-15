class NeighbourManager

  attr_reader :cell, :grid, :size

  def initialize(cell, grid)
    @cell = cell
    @grid = grid
    @size = grid.length
  end

  def number_live
    get_neighbours.select { |neighbour| neighbour.live? }.length
  end

  def get_neighbours
    cell_neighbours = []
    row = grid.flatten.index(cell)/size
    column = grid.flatten.index(cell) % size
    make_neighbours_array(row, column, cell_neighbours)
    cell_neighbours
  end

  def make_neighbours_array(row, column, array)
    push_cells(row-1, column, array, false) unless row == 0
    push_cells(row, column, array, true)
    push_cells(row+1, column, array, false) unless row == size-1
  end

  def push_cells(row, column, array, home_row)
    array.push grid[row][column-1] unless column == 0
    array.push grid[row][column] unless home_row == true
    array.push grid[row][column+1] unless column == size-1
  end

end
