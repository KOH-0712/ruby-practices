#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

MAX_COLUMN = 3

def get_lines_for_print(files_in_current_path)
  number_of_files = files_in_current_path.length
  number_of_files.ceildiv(MAX_COLUMN)
end

def arrange_files(files_in_current_path, line)
  ljust_files = files_in_current_path.map { |x| x.ljust(files_in_current_path.map(&:length).max) }
  sliced_files = ljust_files.each_slice(line).to_a
  sliced_files.each { |a| a[line - 1] = nil if a.length < line }
  sliced_files.transpose
end

def output_files(transposed_files)
  fixed_files = (transposed_files.map { |x| x.join(' ') })
  puts fixed_files
end

params = {}
opt = OptionParser.new
opt.on('-r') { |v| params['r'] = v }
opt.parse!(ARGV)

files_in_current_path = Dir.glob('*')
files_in_current_path = files_in_current_path.reverse if params['r']
line = get_lines_for_print(files_in_current_path)
transposed_files = arrange_files(files_in_current_path, line)
output_files(transposed_files)
