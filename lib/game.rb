require_relative './cell.rb'
require_relative './sample_grid_maker.rb'

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

  def number_live_neighbours(cell)
    neighbours(cell).select { |neighbour| neighbour.live? }.length
  end

  def tick
    self.grid = make_new_gen
  end

  def make_new_gen
    next_gen = []
    grid.each do |row|
      next_gen_row = []
      row.each do |cell|
        next_gen_row.push(Cell.new(next_cell_lives?(cell)))
      end
      next_gen.push(next_gen_row)
    end
    next_gen
  end

  def next_cell_lives?(cell)
    if number_live_neighbours(cell) < 2
      return false
    elsif number_live_neighbours(cell) > 3
      return false
    elsif number_live_neighbours(cell) == 3
      return true
    else
      return cell.live?
    end
  end

  def print_grid
    grid.each do |row|
      string_rendering = ''
      row.each { |cell| cell.live? ? string_rendering << '[x]' : string_rendering << '[ ]' }
      puts string_rendering
    end
  end

end
