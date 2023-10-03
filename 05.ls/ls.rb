#!/usr/bin/env ruby
# frozen_string_literal: true

MAX_COLUMN = 3

class LsCommand1
  def initialize
    @files = Dir.glob('*')
    max_letter = @files.max_by(&:length).length
    @ljust_files = @files.map { |x| x.ljust(max_letter) }
  end

  def decide_lines
    number_of_files = @files.length
    number_of_files.ceildiv(MAX_COLUMN)
  end

  def arrange_files(line)
    sliced_files = @ljust_files.each_slice(line).to_a
    sliced_files.each { |a| a[line - 1] = nil if a.length < line }
    sliced_files.transpose
  end

  def output_files(transposed_files)
    fixed_files = (transposed_files.map { |x| x.join(' ') })
    puts fixed_files
  end
end

if __FILE__ == $PROGRAM_NAME
  result = LsCommand1.new
  line = result.decide_lines
  transposed_files = result.arrange_files(line)
  result.output_files(transposed_files)
end
