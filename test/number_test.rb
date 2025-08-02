require_relative 'test_helper'
require 'number'

class NumberTest < Minitest::Test
  def test_valid_positive_integers
    assert Rpn::Number.valid?("42")
    assert Rpn::Number.valid?("1")
  end

  def test_valid_negative_integers
    assert Rpn::Number.valid?("-42")
    assert Rpn::Number.valid?("-1")
  end

  def test_valid_positive_floats
    assert Rpn::Number.valid?("4.2")
    assert Rpn::Number.valid?("1.3222")
  end

  def test_valid_negative_floats
    assert Rpn::Number.valid?("-4.2")
    assert Rpn::Number.valid?("-1.3222")
  end

  def test_invalid_number_with_letters
    refute Rpn::Number.valid?("abc")
  end

  def test_invalid_number_with_letters_and_numbers
    refute Rpn::Number.valid?("x1y2z3")
  end

  def test_invalid_number_with_spaces_inside
    refute Rpn::Number.valid?("x1  z3")
    refute Rpn::Number.valid?("- 3")
  end
end
