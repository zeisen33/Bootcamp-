# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(*arrs)
    return *arrs.flatten
end

def union2(*arrs)
    newArr = []
    arrs.each {|arr| arr.each {|ele| newArr << ele}}
    newArr
end

p union2(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union2(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
