class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num < 0
      raise "Out of bounds"
    elsif num > @max
      raise "Out of bounds"
    end
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self.[](num).include?(num)
      self.[](num) << num
    end
  end

  def remove(num)
    if self.[](num).include?(num)
      self.[](num).delete(num)
    end
  end

  def include?(num)
    self.[](num).include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def inspect
    @store.each do |bucket|
      @bucket.each do |val|
        "#{val}" if !bucket.empty?
      end
    end
  end

  def insert(num)
    if !self.include?(num)
      self.[](num) << (num)
      @count += 1
      if @count == num_buckets
        self.resize!
      end
    end
  end

  def remove(num)
    if self.[](num).include?(num)
      self.[](num).delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self.[](num).include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = ResizingIntSet.new(num_buckets * 2)
    @store.each do |bucket|
        bucket.each do |val|
          new_set.store[val % (new_set.store.length * 2)] << val
        end
      end 
    @store = new_set.store
    end
    # new_store = Array.new(@store.length * 2) {Array.new}
    # @store.each do |bucket|
    #   bucket.each do |val|
    #     new_store[val % (@store.length * 2)] = val
    #   end
    # end
    # @store = new_store

end
