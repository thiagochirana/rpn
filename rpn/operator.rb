module Rpn
  class Operator
    OPERATIONS = %w[+ - * /].freeze

    def self.valid?(token)
      OPERATIONS.include?(token)
    end

    def self.call(op, a, b)
      raise NotAnOperatorError, "Operador inválido: #{op}" unless valid?(op)
      a.send(op, b)
    end
  end
end
