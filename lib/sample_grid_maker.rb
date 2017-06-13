require_relative './cell.rb'

class SampleGridMaker

  def basic_grid
    grid = []
    5.times do
      row = []
      5.times { row.push(Cell.new(false)) }
      grid.push(row)
    end
    grid
  end

  def blinker
    blinker_grid = basic_grid
    blinker_grid[1][2].make_live
    blinker_grid[2][2].make_live
    blinker_grid[3][2].make_live
    blinker_grid
  end

end
