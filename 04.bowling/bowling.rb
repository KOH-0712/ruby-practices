#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]

scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, i|
  next unless i < 10

  point += if frame[0] == 10 && frames[i + 1][0] == 10
             20 + frames[i + 2][0]
           elsif frame[0] == 10 && frames[i + 1][0] != 10
             10 + frames[i + 1].sum
           elsif frame[0] != 10 && frames[i].sum == 10
             10 + frames[i + 1][0]
           else
             frames[i].sum
           end
end

puts point
