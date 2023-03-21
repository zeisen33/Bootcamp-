def my_map(arr, &prc)
    newArr = []
    arr.each do |el|
        newArr << prc[el]
    end
    newArr
end

def my_select(arr, &prc)
    newArr = []
    arr.each {|el| newArr << el if prc[el]}
    newArr
end

def my_count(arr, &prc)
    count = 0
    arr.each {|el| count += 1 if prc[el]}
    count
end

def my_any?(arr, &prc)
    arr.each {|el| return true if prc[el]}
    false
end

def my_all?(arr, &prc)
    arr.each {|el| return false if !prc[el]}
    true
end

def my_none?(arr, &prc)
    arr.each {|el| return false if prc[el]}
    return true
end

