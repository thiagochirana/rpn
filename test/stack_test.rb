require_relative 'test_helper'
require 'number'
require 'operator'
require 'stack'

class StackTest < Minitest::Test
  def setup
    @stack = Rpn::Stack.new
  end

  def test_evaluate_simple_expression
    result = @stack.evaluate("10 100 +")
    assert_equal 110, result
  end

  def test_evaluate_complex_expression
    result = @stack.evaluate("3 4 + 2 * 7 -")
    assert_equal 7, result
  end

  def test_expression_with_floats
    result = @stack.evaluate("3.5 2.0 +")
    assert_in_delta 5.5, result, 0.001
  end

  def test_expression_with_negatives
    result = @stack.evaluate("-3 -2 *")
    assert_equal 6, result
  end

  def test_expression_with_division
    result = @stack.evaluate("8 4 /")
    assert_equal 2, result
  end

  def test_invalid_token
    assert_raises(ArgumentError) do
      @stack.evaluate("3 x +")
    end
  end
end
