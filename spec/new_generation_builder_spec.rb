require 'new_generation_builder'

describe NewGenerationBuilder do

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

  subject(:new_generation_builder) { described_class.new([[cell_00, cell_01, cell_02, cell_03],
                                        [cell_10, cell_11, cell_12, cell_13],
                                        [cell_20, cell_21, cell_22, cell_23],
                                        [cell_30, cell_31, cell_32, cell_33]]) }

  describe '#make_new_gen' do
    it 'cells die due to underpopulation' do
      expect(new_generation_builder.make_new_gen[0][0].live?).to eq false
    end
    it 'cells die due to overpopulation' do
      expect(new_generation_builder.make_new_gen[1][1].live?).to eq false
    end
    it 'cells become live thanks to reproduction' do
      expect(new_generation_builder.make_new_gen[1][0].live?).to eq true
    end
    it 'other cells are unaffected' do
      expect(new_generation_builder.make_new_gen[1][3].live?).to eq false
    end
  end

end
