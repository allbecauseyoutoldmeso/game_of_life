require_relative './cell.rb'

class SampleGridMaker

  def basic_grid
    grid = []
    6.times do
      row = []
      6.times { row.push(Cell.new(false)) }
      grid.push(row)
    end
    grid
  end

  def blinker
    blinker_grid = basic_grid
    make_coordinates_live(blinker_grid, [[1,2],[2,2],[3,2]])
    blinker_grid
  end

  # def beacon
  #   beacon_grid = basic_grid
  #   beacon_grid[2][2].make_live
  #   beacon_grid[2][3].make_live
  #
  # end

  def toad
  end

  def make_coordinates_live(grid, coordinate_array)
    coordinate_array.each do |coordinates|
      grid[coordinates[0]][coordinates[1]].make_live
    end
  end

end
