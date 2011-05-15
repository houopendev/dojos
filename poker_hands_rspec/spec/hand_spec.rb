require 'spec_helper'

class Card
  describe Hand do

    describe "initialize" do
      it "should not raise an error" do
        expect { hand = Hand.new("2C 3D 8S TD JS") }.to_not raise_error(Hand::InvalidHand)
      end

      it "should return InvalidHand Error" do
        expect { hand = Hand.new("5D 4D 9C KS") }.to raise_error(Hand::InvalidHand)
      end
    end

    describe "#card_count" do
      it "has 5 cards" do
        hand = Hand.new("2H 3D 5S 9C KD")
        hand.card_count.should equal(5)
      end
    end

    describe "#high_card" do
      describe "#value" do
        hand = Hand.new("2H 3D 5S 9C KD")
        it "should be 13" do
          hand.high_card.value.should equal(13)
        end
      end
    end

    describe "#has_pair?" do
      it "should return true" do
        hand = Hand.new("2H 2D KD 5S 9C")
        hand.should have_pair
      end

      it "should return false" do
        hand = Hand.new("2H 3H 5S 9C KD")
        hand.should_not have_pair
      end

      it "should return false with three of a kind" do
        hand = Hand.new("2H 2D 2C 5S 9C")
        hand.should_not have_pair
      end
    end

    describe "#has_three_of_a_kind?" do
      it "should return true" do
        hand = Hand.new("2H 2D 2C 5S 9C")
        hand.should have_three_of_a_kind
      end
    end

    describe "#has_full_house" do
      it "should return true" do
        hand = Hand.new("2H 2D 3S 3D 3H")
        hand.should have_full_house
      end
    end

  end
end
