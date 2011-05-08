require 'spec_helper'

class Card
  describe Card do
    context "#new" do
      describe "and a value of '2H'" do
        it "has a value of 2" do
          card = Card.new("2H")
          card.value.should equal(2)
        end
      end

      describe "with a value of 'KC'" do
        it "has a value of 13" do
          card = Card.new("KC")
          card.value.should equal(13)
        end
      end
    end
  end
end
