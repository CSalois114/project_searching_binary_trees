class Node 
  attr_accessor :left_child, :right_child
  attr_reader :value
  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

def build_tree(ary)
  root = Node.new(ary.shift)
  until ary.length == 0
    value = ary.shift
    node = root
    until left_or_right_child(value, node) == nil
      node = left_or_right_child(value, node)
    end
    value < node.value ? node.left_child = Node.new(value) : node.right_child = Node.new(value)
  end
  root
end

def left_or_right_child(value, node)
  return value < node.value ? node.left_child : node.right_child
end

def breadth_first_search(value, root)
  queue = [root]
  until queue.length == 0
    current_node = queue.shift
    queue.push(current_node.left_child) if current_node.left_child
    queue.push(current_node.right_child) if current_node.right_child
    return current_node if current_node.value == value
  end
  nil
end

def deapth_first_search(value, node)
  right_side_stack = []
  while node
    return node if node.value == value
    right_side_stack.push(node.right_child) if node.right_child
    node = node.left_child ? node.left_child : right_side_stack.pop
  end 
  nil
end
  
def dfs_rec(value, node)
  return node if node.value == value
  result = dfs_rec(value, node.left_child) if node.left_child
  return result if result
  result = dfs_rec(value, node.right_child) if node.right_child
  result ? result : nil
end