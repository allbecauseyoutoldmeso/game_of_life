require_relative './neighbour_manager.rb'

class NewGenerationBuilder

  attr_reader :grid  

  def initialize(grid)
    @grid = grid
  end

  def number_live_neighbours(cell)
    neighbour_manager = NeighbourManager.new(cell, grid)
    neighbour_manager.number_live
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

end
