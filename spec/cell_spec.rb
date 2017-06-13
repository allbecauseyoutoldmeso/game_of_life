require 'cell'

describe Cell do

  subject(:cell) { described_class.new(true)}

  describe '#live?' do
    it 'returns true if the cell is initialized as true' do
      expect(cell.live?).to eq true
    end
  end

end
