module Rpn
  class Stack
    def initialize
      @stack = []
    end

    def push(value)
      @stack.push(value)
    end

    def pop
      @stack.pop
    end

    def evaluate(expression)
      expression.split.each do |token|
        if Number.valid?(token)
          push(token.include?('.') ? token.to_f : token.to_i)
        elsif Operator.valid?(token)
          b = pop
          a = pop
          push(Operator.call(token, a, b))
        else
          raise ArgumentError, "Entrada inválida: #{token}"
        end
      end

      @stack.last
    end
  end
end
