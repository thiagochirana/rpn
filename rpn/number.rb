module Rpn
  class Number
    def self.valid?(token)
      token.match?(/\A-?\d+(\.\d+)?\z/)
    end
  end
end
