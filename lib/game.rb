class Game

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def neighbours(cell)
    puts 'INDEX'
    puts @grid.flatten.index(cell)
    puts @grid.flatten.index(cell)/(@grid.length)
    puts @grid.flatten.index(cell) % @grid.length
  end

  def tick
  end

end
