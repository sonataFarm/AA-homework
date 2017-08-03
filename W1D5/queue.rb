class Queue
  def initialize
    @store = []
  end

  def enqueue(el)
    store << el
    el
  end

  def dequeue
    if store.empty?
      nil
    else
      store.shift
    end
  end

  def show
    store.clone
  end

  private
  attr_reader :store
end
