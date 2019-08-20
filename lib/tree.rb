class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end

   def add(val)
      if val <= @value
        if left.nil?
          @left = TreeNode.new(val)
        else
          @left.add(val)
        end
      else
        if right.nil?
          @right = TreeNode.new(val)
        else
          @right.add(val)
        end
      end
   end

   def find(val)
    if val == @value
      return true
    elsif val <= @value
      return nil if @left.nil
      return @left.find(val)
    else
      return nil if @right.nil?
      return @right.find(val)
    end
   end

   def inorder(array)
      left.inorder(array) unless left.nil? 
      array << @value
      right.inorder(array) unless right.nil?
   end

   def preorder(array)
     array << @value
     left.preorder(array) unless left.nil?
     right.preorder(array) unless right.nil?
   end

   def postorder(array)
    left.postorder(array) unless left.nil?
    right.postorder(array) unless right.nil?
    array << @value
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  def add(value)
    if @root == nil
      @root = TreeNode.new(value)
    else
      @root.add(value)
    end
  end

  def find(val)
    return nil if @root.nil?
    return @root.find(val)
  end

  def inorder
    list = []
    @root.inorder(list) unless @root.nil?
    return list
  end

  def preorder
    list = []
    @root.preorder(list) unless @root.nil?
    return list
  end

  def postorder
    list = []
    @root.postorder(list) unless @root.nil?
    return list
  end
  def to_s
    return self.inorder
  end
end

tree = Tree.new

tree.add(5)
tree.add(3)
tree.add(7)

puts "#{tree.find(7)}"
puts "#{tree.preorder}"
puts "#{tree.postorder}"


puts "#{tree.to_s}"