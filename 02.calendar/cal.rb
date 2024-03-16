#! /usr/bin/env ruby
require 'date'
require 'optparse'

params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")

month = params["m"]
year = params["y"]

days_of_the_week = ["日", "月", "火", "水", "木", "金", "土"]

print(" " * 6)
puts "#{month}月 #{year}"
puts days_of_the_week.join(" ")

first_day = Date.new(year.to_i, month.to_i, 1)
last_day = Date.new(year.to_i, month.to_i, -1)

def blank (x)
  (x * 3).times {print " "}
end

blank(first_day.wday)

(first_day..last_day).each do |date|
  if date.day.to_s.length == 1
    print " "
  end
  print date.day
  print " "
  if date.wday == 6
    print "\n"
  end
end

print "\n"

