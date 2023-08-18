#!/usr/bin/env ruby
# frozen_string_literal: true

files = Dir.glob('*')

def max_letter(files)
  files.max_by(&:length).length
end

max_letter = max_letter(files)

def number_of_files(files)
  files.length
end

number_of_files = number_of_files(files)

MAX_COLUMN = 3

def line(number_of_files)
  (number_of_files.to_f / MAX_COLUMN).ceil
end

line = line(number_of_files)

ljust_files = files.map { |x| x.ljust(max_letter) }

sliced_files = ljust_files.each_slice(line).to_a

# 二次元配列内の要素数が行数より少ない時にnilを入れる。
sliced_files.each { |a| a[line - 1] = nil if a.length < line }

transposed_files = sliced_files.transpose

fixed_files = (transposed_files.map { |x| x.join(' ') })

puts fixed_files
