#!/usr/bin/env ruby

class Fizzbuzz
  def initialize(text)
    @number = text
  end
  def number
    while @number < 21
      if @number % 3 == 0 && @number % 5 == 0
        puts "FizzBuzz"
      elsif @number % 3 == 0
        puts "Fizz"
      elsif @number % 5 == 0
        puts "Buzz"
      else
        puts @number
      end
      @number += 1
    end
  end
end

fizzbuzz = Fizzbuzz.new(1)
fizzbuzz.number
