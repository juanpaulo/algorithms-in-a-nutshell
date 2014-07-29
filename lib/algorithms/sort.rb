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
end

