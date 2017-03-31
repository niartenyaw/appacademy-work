class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    # Remove ourselves from current parents children
    unless @parent.nil?
      @parent.children.delete(self)
    end

    @parent = parent

    unless parent.nil?
      parent.children << self unless has_child?(parent)
    end
  end

  def to_s
    "v: #{@value} : p: #{@parent} : children: #{@children}"
  end

  def has_child?(parent)
    parent.children.include?(self)
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "Not my child" unless @children.include?(child)
    child.parent = nil
    @children.delete(child)
  end

  def dfs(target)
    return self if target == @value
    return nil if @children.empty?

    @children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result.nil?
    end

    nil
  end

  def bfs(target)
    queue = []
    queue.push(self)
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      node.children.each { |child| queue.push(child) }
    end

    nil
  end

end
