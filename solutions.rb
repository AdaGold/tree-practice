class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

def operators_only(node)
  return if node == nil
  if ["+","-","*","/","%"].include?(node.value)
    print node.value + " "
  end
  operators_only(node.left)
  operators_only(node.right)
end

def non_ops(node)
  return 0 if node == nil
  if node.left.nil? && node.right.nil? #isLeaf?
    return 1
  end
  return non_ops(node.left) + non_ops(node.right)
end

def isInTree(node,key)
  return false if node == nil
  if node.value == key
    return true
  end
  return isInTree(node.left,op) || isInTree(node.right,op)
end

#building  `4 * 3 + 2 - 10 % 5`
root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.left.left = TreeNode.new("*")
root.left.left.left = TreeNode.new("4")
root.left.left.right = TreeNode.new("3")
root.left.right = TreeNode.new("2")
root.right = TreeNode.new("%")
root.right.left = TreeNode.new("10")
root.right.right = TreeNode.new("5")

puts "INFIX"
print_infix(root)
puts "\nPREFIX"
print_prefix(root)
puts "\nPOSTFIX"
print_postfix(root)
puts "\nOperators Only"
operators_only(root)
puts "\nNumber of Non-Operators"
print non_ops(root)
puts "\nIs operator in tree?"
puts "^? #{isInTree(root,"^")}"
puts "+? #{isInTree(root,"+")}"
puts "10? #{isInTree(root,"10")}"
puts "100? #{isInTree(root,"100")}"
