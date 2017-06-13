class Cell

  def initialize(boolean)
    @live = boolean
  end

  def live?
    @live
  end

  def make_live
    @live = true
  end

end
