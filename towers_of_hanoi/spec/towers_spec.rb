require 'rspec'
require 'towers'

describe Towers do

  describe '#initialize' do
    let(:size) { 3 }
    subject(:hanoi) { Towers.new(size) }

    it 'sets three towers' do
      expect(hanoi.towers.length).to eq(3)
    end

    it 'sets two of them to be empty' do
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[2]).to be_empty
    end

    it 'sets one to have @size disks' do
      expect(hanoi.towers[0].length).to eq(size)
    end
  end

end
