class Stack
  def initialize
    @store = []
  end

  def add(el)
    store << el
    el
  end

  def remove
    if store.empty?
      nil
    else
      store.pop
    end
  end

  def show
    store.dup
  end

  private
  attr_reader :store
end
