require_relative './cell.rb'
# require_relative './neighbour_manager.rb'
require_relative './sample_grid_maker.rb'
require_relative './new_generation_builder.rb'

class Game

  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def tick
    new_generation_builder = NewGenerationBuilder.new(self.grid)
    self.grid = new_generation_builder.make_new_gen
  end

  def print_grid
    grid.each do |row|
      string_rendering = ''
      row.each { |cell| cell.live? ? string_rendering << '[x]' : string_rendering << '[ ]' }
      puts string_rendering
    end
  end

end
