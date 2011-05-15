require 'spec_helper'

class Card
  describe Card do
    describe "#new" do
      describe "Two of Hearts" do
        it "has a value of 2" do
          card = Card.new("2H")
          card.value.should equal(2)
        end
      end

      describe "King of Clubs" do
        it "has a value of 13" do
          card = Card.new("KC")
          card.value.should equal(13)
        end
      end

      describe "Queen of Clubs" do
        it "has a value of 12" do
          card = Card.new("QC")
          card.value.should equal(12)
        end
      end

      describe "Jack of Clubs" do
        it "has a value of 11" do
          card = Card.new("JC")
          card.value.should equal(11)
        end
      end

      describe "Bad Value" do
        it "should raise StandardError" do
          expect { card = Card.new("ZZ") }.to raise_error(StandardError)
        end
      end
    end
  end
end
