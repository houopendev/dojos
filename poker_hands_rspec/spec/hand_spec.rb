require 'spec_helper'

describe Hand do
  subject do
    Hand.new(card_list)
  end

  describe "#new" do
    context "with 5 cards" do
      it "should not raise an error" do
        expect { hand = Hand.new("2C 3D 8S TD JS") }.to_not raise_error(Hand::InvalidHand)
      end
    end

    context "with less than 5 cards" do
      it "should raise InvalidHand Error" do
        expect { hand = Hand.new("5D 4D 9C KS") }.to raise_error(Hand::InvalidHand, "Valid hand has 5 cards")
      end
    end
  end

  describe "#card_count" do
    let(:card_list) { "2H 3D 5S 9C KD" }
    its(:card_count) { should == 5 }
  end

  describe "Hand Types" do
    context "High Card" do
      let(:card_list) { "2H 3D 5S 9C KD" }
      its("high_card.value") { should == 13 }
    end

    describe "Pair" do
      context "has a pair" do
        let(:card_list) { "2H 2D KD 5S 9C" }
        its(:has_pair?) { should be_true }
      end

      context "does not have a pair" do
        let(:card_list) { "2H 3H 5S 9C KD" }
        its(:has_pair?) { should be_false }
      end
   end

    context "Three of a Kind" do
      let(:card_list) { "2H 2D 2C 5S 9C" }
      its(:has_three_of_a_kind?) { should be_true }
      its(:has_pair?) { should be_false }
    end

    context "Full House" do
      let(:card_list) { "2H 2D 3S 3D 3H" }
      its(:has_full_house?) { should be_true }
    end
  end
end
