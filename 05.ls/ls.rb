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
opt.on('-a') { |v| params['a'] = v }
opt.parse!(ARGV)

flags = params['a'] ? File::FNM_DOTMATCH : 0
files_in_current_path = Dir.glob('*', flags)
line = get_lines_for_print(files_in_current_path)
transposed_files = arrange_files(files_in_current_path, line)
output_files(transposed_files)
