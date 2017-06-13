require 'game'

describe Game do

  let(:cell_00) {double :cell, live?: false}
  let(:cell_01) {double :cell, live?: false}
  let(:cell_02) {double :cell, live?: false}
  let(:cell_03) {double :cell, live?: false}
  let(:cell_10) {double :cell, live?: false}
  let(:cell_11) {double :cell, live?: true}
  let(:cell_12) {double :cell, live?: true}
  let(:cell_13) {double :cell, live?: false}
  let(:cell_20) {double :cell, live?: false}
  let(:cell_21) {double :cell, live?: true}
  let(:cell_22) {double :cell, live?: true}
  let(:cell_23) {double :cell, live?: false}
  let(:cell_30) {double :cell, live?: false}
  let(:cell_31) {double :cell, live?: false}
  let(:cell_32) {double :cell, live?: false}
  let(:cell_33) {double :cell, live?: false}

  subject(:game) { described_class.new([[cell_00, cell_01, cell_02, cell_03],
                                        [cell_10, cell_11, cell_12, cell_13],
                                        [cell_20, cell_21, cell_22, cell_23],
                                        [cell_30, cell_31, cell_32, cell_33]]) }

  it 'expects an orthogonal grid as an argument and displays said grid' do
    expect(game.grid).to eq [[cell_00, cell_01, cell_02, cell_03],
                             [cell_10, cell_11, cell_12, cell_13],
                             [cell_20, cell_21, cell_22, cell_23],
                             [cell_30, cell_31, cell_32, cell_33]]
  end

  describe '#neighbours' do
    it 'returns an array of cell neighbours' do
      expect(game.neighbours(cell_11)).to eq [cell_10, cell_12, cell_01, cell_21]
    end
  end

  describe '#number_live' do
    it 'returns the number of live neighbours' do
      expect(game.number_live(cell_31)).to eq 1
      expect(game.number_live(cell_11)).to eq 3
    end
  end

end
