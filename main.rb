require 'colorize'

require_relative 'rpn/number'
require_relative 'rpn/operator'
require_relative 'rpn/stack'

class Main
  def run
    puts "=".blue * 18
    puts "  RPN Calculator".green
    puts "=".blue * 18

    loop do
      print "\nc:> ".blue
      input = gets&.strip
      break if input.nil? || input.downcase == 'exit'

      if input.empty?
        puts "Digite uma expressão RPN válida e não vazia.".yellow
        next
      end

      begin
        stack = Rpn::Stack.new
        result = stack.evaluate(input)
        puts "=> #{result}".green
      rescue => e
        puts "Oops! #{e.message}".red
      end
    end
  rescue Interrupt
    puts "\nAté mais!\n".light_blue
  end
end

Main.new.run
