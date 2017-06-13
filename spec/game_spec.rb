require 'game'

describe Game do



  orth_grid = [['d','d','d','d'],
               ['d','l','l','d'],
               ['d','l','l','d'],
               ['d','d','d','d']]
  subject(:game) { described_class.new(orth_grid) }

  it 'expects an orthogonal grid as an argument and displays said grid' do
    expect(game.grid).to eq [['d','d','d','d'],
                             ['d','l','l','d'],
                             ['d','l','l','d'],
                             ['d','d','d','d']]
  end

end
