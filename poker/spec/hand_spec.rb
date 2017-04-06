require 'rspec'
require 'hand'

describe Hand do

  subject(:hand) { Hand.new }
  let(:card) { double('card') }

  describe '#initialize' do

    it 'starts hand with no cards in it' do
      expect(hand.cards).to be_empty
    end

  end

  describe '#accept_card' do
    it 'adds the card to the hand' do
      hand.accept_card(card)
      expect(hand.cards).to include(card)
    end

    it 'raises error if the hand already has 5 cards' do
      5.times do
        hand.accept_card(card)
      end
      expect { hand.accept_card(card) }.to raise_error "This hand already has 5 cards"
    end

  end

  describe '#drop_card' do

    it 'removes card at given index' do
      5.times { hand.accept_card(card) }
      hand.drop_card(0)
      expect(hand.cards.length).to eq(4)
    end

  end

end
