require 'cell'

describe Cell do

  subject(:cell) { described_class.new(false)}

  describe '#live?' do
    it 'returns false if the cell is initialized as false' do
      expect(cell.live?).to eq false
    end
  end

  describe '#make_live' do
    it 'makes the cell live' do
      cell.make_live
      expect(cell.live?).to eq true
    end
  end

end
