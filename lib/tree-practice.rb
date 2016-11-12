class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end


def is_valid_infix_tree?(node)
  if (node.left == nil && node.right == nil) # This node is a leaf and must be numerical
    begin
      Integer(node.value)
      return true
    rescue ArgumentError
      return false
    end
  elsif (node.left == nil && node.right != nil) || (node.left != nil && node.right == nil) # Operation without two operands or other imbalance
    return false
  else  # This node is internal and must contain an operator
    left_valid = is_valid_infix_tree?(node.left)
    right_valid = is_valid_infix_tree?(node.right)
    if node.value == "+" || node.value == "-" || node.value == "*" || node.value == "/" || node.value == "%"
      current_valid = true
    else
      current_valid = false
    end
    return left_valid && right_valid && current_valid
  end
end

# Wrapper to check tree up front for validity before calling recursive method
def print_infix(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    print_infix_recursive_portion(node)
    return true
  end
end

# Recursive method
def print_infix_recursive_portion(node)
  return if node == nil
  print_infix_recursive_portion(node.left)
  print node.value + " "
  print_infix_recursive_portion(node.right)
end

# QUESTION 1:
# Wrapper method to set up recursive call and print the final returned hash.
def print_operators(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    result = print_operators_recursive_portion(node, {})
    puts "Operators in this tree:"
    result.each do |k,v|
      puts "#{k}: #{v} instance(s)"
    end
    return true
  end
end

# Recursive method called by wrapper method. This
# method identifies operator nodes as those nodes having two children (non-leaf/
# non-terminal nodes) rather than explicitly by their values.
def print_operators_recursive_portion(node, hash)
  return if node == nil
  print_operators_recursive_portion(node.left, hash)
  if node.left != nil && node.right != nil # Operator is a node with two children
    if hash[node.value] == nil
      hash[node.value] = 1
    else
      hash[node.value] += 1
    end
  end
  print_operators_recursive_portion(node.right, hash)
  return hash
end

# QUESTION 2:
# Wrapper method to set up recursive call for counting leaves and their levels.

def num_non_operators(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    result = num_non_operators_recursive_portion(node, {}, 1)
    total = 0
    puts "Where the top level of the tree is defined as level 1:"
    result.each do |k,v|
      puts "In level #{k}, there are #{v[0]} non-operator nodes: #{v[1]}"
      total += v[0]
    end
    puts "TOTAL: #{total} non-operator nodes"
    return true
  end
end

# Recursive method called by wrapper method.

def num_non_operators_recursive_portion(node, hash, level)
  return if node == nil
  if node.left == nil && node.right == nil # Operator is a leaf
    if hash[level] == nil
      hash[level] = [1,[node.value]]
    else
      hash[level][0] += 1
      hash[level][1] << node.value
    end
  else
    if hash[level] == nil
      hash[level] = [0,[]]
    end
  end
  num_non_operators_recursive_portion(node.left, hash, level + 1)
  num_non_operators_recursive_portion(node.right, hash, level + 1)
  return hash
end

# QUESTION 3: prefix notation (operator before operands, as in * 3 4)

def print_prefix(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    print_prefix_recursive_portion(node)
    return true
  end
end

def print_prefix_recursive_portion(node)
  return if node == nil
  print node.value + " "
  print_prefix_recursive_portion(node.left)
  print_prefix_recursive_portion(node.right)
end

# In postfix notation (as in 3 4 *)

def print_postfix(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    print_postfix_recursive_portion(node)
    return true
  end
end

def print_postfix_recursive_portion(node)
  return if node == nil
  print_postfix_recursive_portion(node.left)
  print_postfix_recursive_portion(node.right)
  print node.value + " "
end

# QUESTION 4: Method to return number of instances of operator in tree.

def is_operator_in_tree?(node, operator)
  if !is_valid_infix_tree?(node)
    return false
  else
    return is_operator_in_tree_recursive_portion(node, operator)
  end
end

def is_operator_in_tree_recursive_portion(node, operator)
  return 0 if node == nil
  count = is_operator_in_tree_recursive_portion(node.left, operator)
  if node.value == operator
    count += 1
  end
  count += is_operator_in_tree_recursive_portion(node.right, operator)
  return count
end

# QUESTION 5: Evaluate the tree (assuming it follows infix notation in its construction)
def evaluate(node)
  if !is_valid_infix_tree?(node)
    return false
  else
    return evaluate_recursive_portion(node)
  end
end

def evaluate_recursive_portion(node)
  if (node.left == nil && node.right == nil)
    return Integer(node.value)
  else
    left_operand = evaluate_recursive_portion(node.left)
    right_operand = evaluate_recursive_portion(node.right)
    if node.value == "+"
      result = left_operand + right_operand
    elsif node.value == "-"
      result = left_operand - right_operand
    elsif node.value == "*"
      result = left_operand * right_operand
    elsif node.value == "/"
      result = left_operand / right_operand
    elsif node.value == "%"
      result = left_operand % right_operand
    end
    return result
  end
end


# root = TreeNode.new("+")
# root.left = TreeNode.new("3")
# root.right = TreeNode.new("2")
# print_infix(root)

# 4 * 3 + 2 - 10 % 5
#
root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.right = TreeNode.new("%")
root.left.left = TreeNode.new("*")
root.left.right = TreeNode.new("2")
root.left.left.left = TreeNode.new("4")
root.left.left.right = TreeNode.new("3")
root.right.left = TreeNode.new("10")
root.right.right = TreeNode.new("5")
puts print_postfix(root)


# print_operators(root)
#
# num_non_operators(root)
#
# print_prefix(root)
# puts
# print_postfix(root)
# puts
# puts is_operator_in_tree?(root, "%")
# puts "RESULT: #{evaluate(root)}"


# root = TreeNode.new("-")
# root.left = TreeNode.new("+")
# root.right = TreeNode.new("%")
# root.left.left = TreeNode.new("*")
# root.left.right = TreeNode.new("2")
# root.left.left.left = TreeNode.new("4")
# root.left.left.right = TreeNode.new("3")
# root.right.left = TreeNode.new("10")
# root.right.right = TreeNode.new("+")
# root.right.right.left = TreeNode.new("5")
# root.right.right.right = TreeNode.new("6")
