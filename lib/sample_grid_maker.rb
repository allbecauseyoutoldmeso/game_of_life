require_relative './cell.rb'

class SampleGridMaker

  def blinker
    make_coordinates_live([[1,2],[2,2],[3,2]])
  end

  def beacon
    make_coordinates_live([[1,1],[1,2],[2,1],[2,2],[3,3],[3,4],[4,3],[4,4]] )
  end

  def toad
    make_coordinates_live([[2,2],[2,3],[2,4],[3,1],[3,2],[3,3]])
  end

  def glider
    make_coordinates_live([[1,1],[1,3],[2,2],[2,3],[3,2]])
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

  def make_coordinates_live(coordinate_array)
    grid = basic_grid
    coordinate_array.each do |coordinates|
      grid[coordinates[0]][coordinates[1]].make_live
    end
    grid
  end

end
