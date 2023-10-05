#!/usr/bin/env ruby
# frozen_string_literal: true

MAX_COLUMN = 3

def decide_lines(files)
  number_of_files = files.length
  number_of_files.ceildiv(MAX_COLUMN)
end

def arrange_files(files, line)
  ljust_files = files.map { |x| x.ljust(files.map(&:length).max) }
  sliced_files = ljust_files.each_slice(line).to_a
  sliced_files.each { |a| a[line - 1] = nil if a.length < line }
  sliced_files.transpose
end

def output_files(transposed_files)
  fixed_files = (transposed_files.map { |x| x.join(' ') })
  puts fixed_files
end

option = ARGV[0]
files = Dir.glob('*') if option.nil?
files = Dir.entries('.') if option == '-a'
line = decide_lines(files)
transposed_files = arrange_files(files, line)
output_files(transposed_files)
