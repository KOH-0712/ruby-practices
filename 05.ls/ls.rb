#!/usr/bin/env ruby
# frozen_string_literal: true

files = []

Dir.glob('*') do |d|
  files.push(d)
end

def max_letter(files)
  files.max_by(&:length).length
end

max_letter = max_letter(files)

def number_of_files(files)
  files.length
end

number_of_files = number_of_files(files)

max_column = 3
# 指定の最大列数。

def line(number_of_files, max_column)
  (number_of_files.to_f / max_column).ceil
end

line = line(number_of_files, max_column)

ljust_files = files.map { |x| x.ljust(max_letter) }
# ljustで文字数を揃える

sliced_files = ljust_files.each_slice(line).to_a
# 行数個ずつの二次元配列を作成

sliced_files.each { |a| a[line - 1] = nil if a.length < line }
# 二次元配列内の要素数が行数より少ない時にnilを入れる。

transposed_files = sliced_files.transpose
# 配列にnilを入れたものをtranspose

fixed_files = (transposed_files.map { |x| x.join(' ') })
# 二次元配列を" "を挟めて縦に出力する。

puts fixed_files
