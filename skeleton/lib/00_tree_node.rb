
class PolyTreeNode
  attr_accessor :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
    
  end

  def parent=(node)
    self.parent.children.delete(self) unless self.parent.nil?
    @parent = node
    if node 
      @parent.children << self unless @parent.children.include?(self)
    end
  end
  
  def add_child(child_node)
    child_node.parent = self
    self.children << child_node unless self.children.include?(child_node)
  end 
  
  def remove_child(child_node)
    child_node.parent = nil #become orphan
    raise "not a child" if child_node.parent == nil #become orphan
  end
  
  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      
      done = child.dfs(target_value)
      return done unless done.nil?
    end
    nil
  end
  
  def bfs(target_value)

    #return self if self.value == target_value
    queue = []
    
    queue << self
    until queue.empty?
      checking = queue.shift

      if checking.value == target_value
        return checking
      else
      queue.concat(checking.children)
      end
    end
    nil
  end

end


