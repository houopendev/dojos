require File.expand_path('../test_helper', __FILE__)

class TestCard < Test::Unit::TestCase

  def setup
    
  end

  def test_initialization
    card = Card.new("2H")
    assert_equal 2, card.value
  end
  
  def test_initialization_has_suit
    card = Card.new("2H")
    assert_equal "H", card.suit
  end
  
  def test_king_should_have_value_of_13
    card = Card.new("KC")
    assert_equal 13, card.value
  end
  
  def test_queen_should_have_value_of_12
    card = Card.new("QC")
    assert_equal 12, card.value
  end

  def test_jack_should_have_value_of_11
    card = Card.new("JC")
    assert_equal 11, card.value
  end
  
  def test_only_valid_card_values_are_allowed
    assert_raise StandardError do
      card = Card.new("ZZ")
    end
  end
end
