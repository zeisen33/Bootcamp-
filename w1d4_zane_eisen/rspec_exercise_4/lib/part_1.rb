def my_reject(arr, &prc)
    arr.select {|el| !prc[el]}
end

def my_one?(arr, &prc)
    newArr = arr.select {|el| prc[el]}
    newArr.length == 1
end

def hash_select(hsh, &prc)
    newHash = {} 
    hsh.each {|k, v| newHash[k] = v if prc[k, v]}
    newHash
end
# p hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14},{ |k, v| "aeiou".include?(k) }) 
# p hash_select(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| v.even? }).to eq({"a"=>0, "c"=> 2, "o"=>14})

def xor_select(arr, prc1, prc2)
    newArr = []
    arr.each do |el|
        if prc1[el] && !prc2[el]
            newArr << el
        elsif !prc1[el] && prc2[el]
            newArr << el
        end
    end
    newArr
end

def proc_count(val, procsArr)
    procsArr.count {|prc| prc[val]}
end