require_relative './cell.rb'

class SampleGridMaker

  def blinker
    blinker_grid = basic_grid
    make_coordinates_live(blinker_grid, [[1,2],[2,2],[3,2]])
    blinker_grid
  end

  def beacon
    beacon_grid = basic_grid
    make_coordinates_live(beacon_grid, [[1,1],[1,2],[2,1],[2,3],[3,3],[3,4],[4,3],[4,4]] )
    beacon_grid
  end

  def toad
    toad_grid = basic_grid
    make_coordinates_live(toad_grid, [[2,2],[2,3],[2,4],[3,1],[3,2],[3,3]])
    toad_grid
  end

  def basic_grid
    grid = []
    6.times do
      row = []
      6.times { row.push(Cell.new(false)) }
      grid.push(row)
    end
    grid
  end

  def make_coordinates_live(grid, coordinate_array)
    coordinate_array.each do |coordinates|
      grid[coordinates[0]][coordinates[1]].make_live
    end
  end

end
