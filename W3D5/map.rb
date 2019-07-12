class Map
    attr_reader :array
    def initialize
        @array = []
    end

    def set(k, v)
    pair = array.index { |pair| pair[0] == k }
    if pair
      array[pair][1] = v
    else
      array.push([k, v])
    end
    v
  end

  def get(key)
    array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(array)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  

end

my_map = Map.new 
my_map.set("hello", 1)
my_map.set("stan", 2)
p my_map.array[0]
p my_map.show
