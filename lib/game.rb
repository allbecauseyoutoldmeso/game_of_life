require_relative './cell.rb'
require_relative './neighbour_manager.rb'
require_relative './sample_grid_maker.rb'

class Game

  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def neighbours(cell)
    neighbour_manager = NeighbourManager.new(cell, grid)
    neighbour_manager.get_neighbours
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
