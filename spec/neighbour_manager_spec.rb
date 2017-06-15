require 'neighbour_manager'

describe NeighbourManager do

  let(:cell_00) {double :cell, live?: true}
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

  subject(:neighbour_manager) { described_class.new(cell_11,[[cell_00, cell_01, cell_02, cell_03],
                                        [cell_10, cell_11, cell_12, cell_13],
                                        [cell_20, cell_21, cell_22, cell_23],
                                        [cell_30, cell_31, cell_32, cell_33]]) }
  subject(:neighbour_manager_1) { described_class.new(cell_00,[[cell_00, cell_01, cell_02, cell_03],
                                        [cell_10, cell_11, cell_12, cell_13],
                                        [cell_20, cell_21, cell_22, cell_23],
                                        [cell_30, cell_31, cell_32, cell_33]]) }
  subject(:neighbour_manager_2) { described_class.new(cell_33,[[cell_00, cell_01, cell_02, cell_03],
                                        [cell_10, cell_11, cell_12, cell_13],
                                        [cell_20, cell_21, cell_22, cell_23],
                                        [cell_30, cell_31, cell_32, cell_33]]) }


  describe '#get_neighbours' do
    it 'returns an array of cell neighbours' do
      expect(neighbour_manager.get_neighbours).to eq [cell_00, cell_01, cell_02, cell_10, cell_12, cell_20, cell_21, cell_22]
    end
    it 'can handle edge cases' do
      expect(neighbour_manager_1.get_neighbours).to eq [cell_01, cell_10, cell_11]
      expect(neighbour_manager_2.get_neighbours).to eq [cell_22, cell_23, cell_32]
    end
  end

  describe '#number_live' do
    it 'returns the number of live neighbours' do
      expect(neighbour_manager.number_live).to eq 4
    end
  end


end
