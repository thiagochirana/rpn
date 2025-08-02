require_relative 'test_helper'
require 'operator'

class OperatorTest < Minitest::Test
  def test_valid_plus_operator
    assert Rpn::Operator.valid?("+")
  end

  def test_valid_minus_operator
    assert Rpn::Operator.valid?("-")
  end

  def test_valid_times_operator
    assert Rpn::Operator.valid?("*")
  end

  def test_valid_divide_operator
    assert Rpn::Operator.valid?("/")
  end

  def test_invalid_operator
    %w[% A x ** & @].each do |op|
      refute Rpn::Operator.valid?(op)
    end
  end

  def test_valid_operation_execution
    assert_equal 6, Rpn::Operator.call("+", 2, 4)
    assert_equal 3, Rpn::Operator.call("-", 5, 2)
    assert_equal 10, Rpn::Operator.call("*", 2, 5)
    assert_equal 2, Rpn::Operator.call("/", 5, 2)
  end
end
