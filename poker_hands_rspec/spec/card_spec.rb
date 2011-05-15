require 'spec_helper'

describe Card do
  subject do
    Card.new(card_type)
  end
  
  describe "#value" do  
    context "Two of Hearts" do
      let(:card_type) { "2H" }
      its(:value) { should == 2 }
    end
  
    describe "Face Cards" do  
    
      context "King of Clubs" do
        let(:card_type) { "KC" }
        its(:value) { should == 13 }
      end
  
      context "Queen of Clubs" do
        let(:card_type) { "QC" }
        its(:value) { should == 12 }
      end

      context "Jack of Hearts" do
        let(:card_type) { "JH" }
        its(:value) { should == 11 }
      end
    end
    
    context "Bad Value" do
      it "should raise StandardError" do
        expect { card = Card.new("ZZ") }.to raise_error(StandardError)
      end
    end
  end
end
