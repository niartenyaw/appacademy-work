class LRUCache
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif length == size
      @cache.pop
    end
    @cache.unshift(el)
  end

  def show
    p @cache
    nil
  end

  private
  # helper methods go here!

end
