$: << File.join(File.expand_path(File.dirname(__FILE__)), '../lib')
require 'algorithms'
include Algorithms

require 'rubygems'
require 'rbench'

RBench.run(10) do

  sorts = %w(ruby insertion_sort median_sort quick_sort selection_sort heap_sort counting_sort bucket_sort)
  sorts.each { |sort| self.send(:column, sort.intern) }

  n = 1000

  proc = lambda { |scope, ary|
    scope.ruby { ary.dup.sort }
    scope.insertion_sort { Sort.insertion_sort(ary.dup) }
    scope.median_sort { Sort.median_sort(ary.dup) }
    scope.quick_sort { Sort.quick_sort(ary.dup) }
    scope.selection_sort { Sort.selection_sort(ary.dup) }
    scope.heap_sort { Sort.heap_sort(ary.dup) }
    scope.counting_sort { Sort.counting_sort(ary.dup) }
    scope.bucket_sort { Sort.bucket_sort(ary.dup) }
  }

  report "Already sorted" do
    sorted_array = Array.new(n) { rand(n) }.sort
    proc.call(self, sorted_array)
  end

  report "Random" do
    random_array = Array.new(n) { rand(n) }
    proc.call(self, random_array)
  end
end