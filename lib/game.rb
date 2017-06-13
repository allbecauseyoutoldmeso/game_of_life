require 'cell'

class Game

  attr_reader :grid, :size
  attr_writer :grid

  def initialize(grid)
    @grid = grid
    @size = grid.length
  end

  def neighbours(cell)
    cell_neighbours = []
    row = grid.flatten.index(cell)/size
    column = grid.flatten.index(cell) % size
    push_cells(row-1, column, cell_neighbours, false) unless row == 0
    push_cells(row, column, cell_neighbours, true)
    push_cells(row+1, column, cell_neighbours, false) unless row == size-1
    cell_neighbours
  end

  def push_cells(row, column, array, home_row)
    array.push grid[row][column-1] unless column == 0
    array.push grid[row][column] unless home_row == true
    array.push grid[row][column+1] unless column == size-1
  end

  def number_live(cell)
    neighbours(cell).select { |neighbour| neighbour.live? }.length
  end

  def tick
    next_gen = []
    grid.each do |row|
      next_gen_row = []
      row.each do |cell|
        next_gen_cell = Cell.new(false) if number_live(cell) < 2
        next_gen_cell = Cell.new(true) if number_live(cell) >= 2
        next_gen_row.push(next_gen_cell)
      end
      next_gen.push(next_gen_row)
    end
    self.grid = next_gen
  end

end
