class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  # Time Complexity: O(n) worst case
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def add_helper(current_node, key, value)
    if current_node.nil?
      return TreeNode.new(key, value)
    end 
    
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end 
    return current_node
  end 
  
  # Time Complexity: O(log(n) best case, O(n) worst case
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end
  
  def find_helper(current_node, key)
    if current_node.nil?
      return nil 
    end 
    
    if key > current_node.key 
      current_node.right = find_helper(current_node.right, key)
    elsif key < current_node.key
      current_node.left = find_helper(current_node.left, key)
    else
      return current_node.value
    end
  end

  # Time Complexity: O(n)
  # Space Complexity:  O(n)
  def inorder
    arr = []
    if @root.nil?
      return arr
    end 
    current_node = @root
    return inorder_helper(current_node, arr)
  end
  
  def inorder_helper(current_node, arr)
    if current_node.nil?
      return arr
    end 
    inorder_helper(current_node.left, arr)
    arr << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, arr)
    return arr
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    arr = []
    if @root.nil?
      return arr
    end 
    current_node = @root
    return preorder_helper(current_node, arr)
  end
  
  def preorder_helper(current_node, arr)
    if current_node.nil?
      return arr
    end 
    arr << { key: current_node.key, value: current_node.value }
    preorder_helper(current_node.left, arr)
    preorder_helper(current_node.right, arr)
    return arr
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    arr = []
    if @root.nil?
      return arr
    end 
    current_node = @root
    return postorder_helper(current_node, arr)
  end
  
  def postorder_helper(current_node, arr)
    if current_node.nil?
      return arr
    end 
    postorder_helper(current_node.left, arr)
    postorder_helper(current_node.right, arr)
    arr << { key: current_node.key, value: current_node.value }
    return arr
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n) - stack
  def height(current_node = @root)
    if current_node.nil?
      return 0
    end
    
    r = height(current_node.right)
    l = height(current_node.left)
    
    return [r, l].max + 1
  end

  # did not decide to do optionals
end
