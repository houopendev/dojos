class HandType
  HighCard = 0x00
  Pair = 0x01
  ThreeOfAKind = 0x02
  FullHouse = 0x04
  FourOfAKind = 0x08
  Straight = 0x10
  Flush = 0x20
  StraightFlush = 0x40
  RoyalFlush = 0x80
end

class Hand
  
  class InvalidHand < StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end

  attr_reader :cards
  
  def initialize(cards)
    @cards = cards.split(" ").map {|c| Card.new(c)}
    raise InvalidHand.new "Valid hand has 5 cards" if @cards.count < 5
  end
  
  def card_count
    @cards.count  
  end
  
  def value
    return HandType::StraightFlush if has_flush? && has_straight?
    return HandType::Flush if has_flush?
    return HandType::Straight if has_straight?
    return HandType::FourOfAKind if has_four_of_a_kind?
    return HandType::FullHouse if has_full_house?
    return HandType::ThreeOfAKind if has_three_of_a_kind?
    return HandType::Pair if has_pair?
    return HandType::HighCard
  end
  
  def high_card
    @cards.sort_by(&:value).last
  end
    
  private

  def has_pair?
    set_of?(2) 
  end
  
  def has_three_of_a_kind?
    set_of?(3)
  end
  
  def has_full_house?
    set_of?(2) && set_of?(3)
  end
  
  def has_four_of_a_kind?
    set_of?(4)
  end
  
  def has_straight?
    start_check = 0
    # if we have an ace in the hand, add one to the end to handle straights
  
    @cards.sort_by(&:value).each do |c| 
      if start_check == 0 
        start_check = c.value
      else
        if c.value - 1 != start_check 
    		  return false
  		  end
    	end
      start_check = c.value
    end
  end
  
  def has_flush?
    same_suit_set.values.select{|v| v == 5}.any?
  end
  
  def set_of?(count)
    same_card_set.values.select{|v| v == count}.any?
  end
  
  def same_card_set
    card_values={}
    @cards.each do |c| 
      card_values[c.value] ||= 0
      card_values[c.value] +=1
    end
    card_values
    
  end

  def same_suit_set
    suit_values={}
    @cards.each do |c|
      suit_values[c.suit] ||= 0
      suit_values[c.suit] +=1
    end
    suit_values
  end    
end
