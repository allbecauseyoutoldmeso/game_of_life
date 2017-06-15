require 'sample_grid_maker'

describe SampleGridMaker do

  subject(:grid_maker) { described_class.new() }

  describe '#blinker' do
    it 'returns a blinker grid' do
      expect(grid_maker.blinker[1][2].live? && grid_maker.blinker[2][2].live? && grid_maker.blinker[3][2].live?).to eq true
    end
  end

  describe '#make_coordinates_live' do
    it 'makes specified coordinates live' do
    expect(grid_maker.make_coordinates_live([[1,1]])[1][1].live?).to eq true
    end
  end

  describe '#basic_grid' do
    it 'returns a six by six array of dead cells' do
    expect(grid_maker.basic_grid.length).to eq 6
    expect(grid_maker.basic_grid.any? { |row| row.any? { |cell| cell.live? == true }}).to eq false
    end
  end

end
