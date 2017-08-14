class LRUCache
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    # returns number of elements currently in cache
    store.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    store.delete(el) if include?(el)
    store << el
    store.shift if count > size

    el
  end

  def show
    # shows the items in the cache, with the LRU item first
    print store
  end

  private
  attr_reader :store, :size

  def include?(el)
    store.include?(el)
  end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show
