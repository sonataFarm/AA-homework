class Map
  def initialize
    @store = []
  end

  def assign(key, val)
    store << [key, val]
  end

  def lookup(key)
    store.each do |k, v|
      return v if key == k
    end

    nil
  end

  def remove(key)
    store.delete_if { |k, v| k == key }
  end

  def show
    store.clone
  end

  private
  attr_accessor :store
end
