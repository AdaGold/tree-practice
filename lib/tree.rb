class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

   def inorder(list)
    list = left.inorder(list) unless left.nil?
    list << {value: value, key: key}
    list = right.inorder(list) unless right.nil?
    return list
   end

   def preorder(list)
    list << {value: value, key: key}
    list = left.preorder(list) unless left.nil?
    list = right.preorder(list) unless right.nil?
    return list
   end

   def postorder(list)
    list = left.postorder(list) unless left.nil?
    list = right.postorder(list) unless right.nil?
    list << {value: value, key: key}
    return list
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    until current.nil?
      if current.key == key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end

    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?
    return @root.inorder([])
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    return @root.preorder([])
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    return @root.postorder([])
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    queue = @root.nil? ? [] : [@root]
    answer = []

    until queue.empty?
      current = queue.shift
      answer << {value: current.value, key: current.key}
      queue.push current.left unless current.left.nil?
      queue.push current.right unless current.right.nil?
    end

    return answer
  end

  def delete(key)
    value = self.find(key)
    @root = remove_helper(@root, key)
    return value
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end

  private

  def max(num1, num2)
    return num1 > num2 ? num1 : num2
  end

  def height_helper(current_node)
    return 0 if current_node.nil?
    return 1 + max(height_helper(current_node.left), height_helper(current_node.right))
  end

  def remove_helper(current_node, key)
    return nil if current_node.nil?

    if current_node.key > key
      current_node.left = remove_helper(current_node.left, key)
      return current_node
    end

    if current_node.key < key
      current_node.right = remove_helper(current_node.right, key)
      return current_node
    end

    if current_node.left.nil? && current_node.right.nil?
      return nil
    end

    if current_node.left.nil?
      return current_node.right
    end

    if current_node.right.nil?
      return current_node.left
    end

    deleted_value = current_node.value

    largest_child = find_largest_child(current.left)
    current_node.key = largest_child.key
    current_node.value = largest_child.value
    remove_helper(current_node.left, largest_child.key)

    return current_node
  end

  def find_largest_child(current_node)
    return current_node if current_node.right.nil?
    return find_largest_child(current_node.right)
  end

  def add_helper(current_node, key, value)
    if current_node.nil?
      return TreeNode.new(key, value)
    else
      if current_node.key > key
        current_node.left = add_helper(current_node.left, key, value)
      else
        current_node.right = add_helper(current_node.right, key, value)
      end
    end
    return current_node
  end
end
 