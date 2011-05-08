class Hand
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards.split(" ").map {|c| Card.new(c)}
  end
  
  def card_count
    @cards.count  
  end
  
  def high_card
    @cards.sort_by(&:value).last
  end
  
  def has_pair?
    set_of?(2) 
  end
  
  def has_three_of_a_kind?
    set_of?(3)
  end
  
  def has_full_house?
    set_of?(2) && set_of?(3)
  end
  
  
  private
  
  def sequence_of(continuous)
    
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
  
end
