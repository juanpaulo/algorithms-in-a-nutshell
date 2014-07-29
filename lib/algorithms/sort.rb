module Algorithms::Sort

  # Name: Insertion Sort
  # Context: Use INSERTION SORT when you have a small number of elements to sort or the elements in the initial collection are already “nearly sorted.” Determining when the array is “small enough” varies from one machine to another and by program- ming language. Indeed, even the type of element being compared may be significant.
  # Best: О(n)
  # Average: О(n^2)
  # Worst: О(n^2)
  # Concepts: Array
  def self.insertion_sort(container)
    return container if container.size < 2
    container.each_with_index do |value, pos|
      i = pos - 1
      while i >= 0 and container[i] > value do
        container[i + 1] = container[i]
        i-=1
      end
      container[i + 1] = value
    end
    container
  end

  # Name: Median Sort
  # Context: Implementing MEDIAN SORT depends on efficiently selecting the median element from an unsorted array. As is typical in computer science, instead of answering this question, we answer a different question, which ultimately provides us with a solution to our original question. Imagine someone provided you with a function p = partition (left, right, pivotIndex), which selects the element A[pivotIndex] to be a special pivot value that partitions A[left,right] into a first half whose elements are smaller or equal to pivot and a second half whose elements are larger or equal to pivot. Note that left≤pivotIndex≤right, and the value p returned is the location within the subarray A[left,right] where pivot is ultimately stored. A C implementation of partition is shown in Example 4-3.
  # Best: О(n log n)
  # Average: О(n log n)
  # Worst: О(n^2)
  # Concepts: Recursion, Array, Divide and Conquer
  def swap_elements(array, element_1, element_2)
    array[element_1], array[element_2] = array[element_2], array[element_1]
  end

  def find_median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
  end

  def median_sort(container, left=0, right=container.size-1)
    return container if right <= left
    puts container.inspect

    #find median value median in container[left..right]
    median = find_median(container[left..right])
    me = container.index(median)
    mid = (right + left) / 2
    puts "=> #{median}, #{me}, #{mid}"

    swap_elements(container, mid, me)
    puts container.inspect
    container[left..(mid - 1)].each_with_index do |left_value, i|
      if left_value > median
        k = container[(mid + 1)..right].find_index { |right_value| right_value <= median }
        puts "=> #{i}, #{k}"
        swap_elements(container, i, mid + 1 + k) unless k.nil?
        puts container.inspect
      end
    end
    puts container.inspect
    puts "==="
    median_sort(container, left, mid - 1)
    median_sort(container, mid + 1, right)
  end

  # Name: Quick Sort
  # Context: ???
  # Best: О(n log n)
  # Average: О(n log n)
  # Worst: О(n^2)
  # Concepts: Recursion, Array, Divide and Conquer
  def self.quick_sort(container, left=0, right=container.size-1)
    if left < right
      pi = partition(container, left, right)
      quick_sort(container, left, pi - 1)
      quick_sort(container, pi + 1, right)
    end
    container
  end

  def self.partition(container, left, right)
    p = left # TODO benchmark other pivot alternatives
    container[p], container[right] = container[right], container[p] # swap pivot and right
    store = left
    (left..right-1).each do |i|
      value = container[i]
      if value <= container[right]
        container[i], container[store] = container[store], container[i] # swap iterator and store
        store += 1
      end
    end
    container[store], container[right] = container[right], container[store] # swap store and right
    store
  end
end

