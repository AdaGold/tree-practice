require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'


require_relative '../lib/tree-practice'

describe "Testing FizzBuzz" do

  it "Can make a node with left and right pointers" do
    node = TreeNode.new("+")
    expect(node.value).must_equal("+")
    expect(node.left).must_equal(nil)
    expect(node.right).must_equal(nil)

    node.left = TreeNode.new("4")
    node.right = TreeNode.new("7")
    expect(node.left.value).must_equal("4")
    expect(node.right.value).must_equal("7")
  end

  it "Can determine if tree is a valid infix format tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    expect(is_valid_infix_tree?(root)).must_equal(true)
    # Make a terminal node (leaf) contain an operator
    root.right.right.value = "+"
    expect(is_valid_infix_tree?(root)).must_equal(false)
    # Fix the leaf and make an internal node contain a number rather than an operator
    root.right.right.value = "5"
    root.value = "4"
    expect(is_valid_infix_tree?(root)).must_equal(false)
    # Fix the root and remove one of the operands
    root.value = "-"
    root.right.right = nil
    expect(is_valid_infix_tree?(root)).must_equal(false)
    # Replace the missing operand with a non-numerical operand
    root.right.right = TreeNode.new("chihuahuas")
    expect(is_valid_infix_tree?(root)).must_equal(false)
  end

  it "Can print tree in infix format" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")

    Proc.new{print_infix(root)}.must_output("4 * 3 + 2 - 10 % 5 ")

    root2 = TreeNode.new("+")
    root2.left = TreeNode.new("3")
    root2.right = TreeNode.new("4")

    Proc.new{print_infix(root2)}.must_output("3 + 4 ")

    root3 = TreeNode.new("0")

    Proc.new{print_infix(root3)}.must_output("0 ")
  end

  it "Returns false when trying to print an invalid tree in infix format" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(print_infix(root)).must_equal(false)
  end

  it "Prints a summary of the number of operators in a tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    Proc.new{print_operators(root)}.must_output("Operators in this tree:\n*: 1 instance(s)\n+: 1 instance(s)\n-: 1 instance(s)\n%: 1 instance(s)\n")

    # Replace - with a second + sign
    root.value = "+"
    Proc.new{print_operators(root)}.must_output("Operators in this tree:\n*: 1 instance(s)\n+: 2 instance(s)\n%: 1 instance(s)\n")

    root = TreeNode.new("0")
    Proc.new{print_operators(root)}.must_output("Operators in this tree:\n")
  end

  it "Returns false when trying to print operators of an invalid tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(print_operators(root)).must_equal(false)
  end

  it "Prints the number of leaves (numbers) per level in an infix format tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")

    Proc.new{num_non_operators(root)}.must_output("Where the top level of the tree is defined as level 1:\nIn level 1, there are 0 non-operator nodes: []\nIn level 2, there are 0 non-operator nodes: []\nIn level 3, there are 3 non-operator nodes: [\"2\", \"10\", \"5\"]\nIn level 4, there are 2 non-operator nodes: [\"4\", \"3\"]\nTOTAL: 5 non-operator nodes\n")

    root2 = TreeNode.new("+")
    root2.left = TreeNode.new("3")
    root2.right = TreeNode.new("4")

    Proc.new{num_non_operators(root2)}.must_output("Where the top level of the tree is defined as level 1:\nIn level 1, there are 0 non-operator nodes: []\nIn level 2, there are 2 non-operator nodes: [\"3\", \"4\"]\nTOTAL: 2 non-operator nodes\n")

    root3 = TreeNode.new("0")
    Proc.new{num_non_operators(root3)}.must_output("Where the top level of the tree is defined as level 1:\nIn level 1, there are 1 non-operator nodes: [\"0\"]\nTOTAL: 1 non-operator nodes\n")
  end

  it "Returns false for the number of leaves per level in an invalid infix format tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(num_non_operators(root)).must_equal(false)
  end

  it "Prints an infix-formatted tree in prefix format" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    Proc.new{print_prefix(root)}.must_output("- + * 4 3 2 % 10 5 ")

    root = TreeNode.new("0")
    Proc.new{print_prefix(root)}.must_output("0 ")
  end

  it "Printing an infix-formatted tree in prefix format returns false if tree is not valid" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(print_prefix(root)).must_equal(false)
  end

  it "Prints an infix-formatted tree in postfix format" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    Proc.new{print_postfix(root)}.must_output("4 3 * 2 + 10 5 % - ")

    root = TreeNode.new("0")
    Proc.new{print_postfix(root)}.must_output("0 ")
  end

  it "Printing an infix-formatted tree in postfix format returns false if tree is not valid" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(print_postfix(root)).must_equal(false)
  end

  it "Returns number of instances of an operator in a tree" do
    root = TreeNode.new("+")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    expect(is_operator_in_tree?(root, "+")).must_equal(2)
    expect(is_operator_in_tree?(root, "-")).must_equal(0)

    root = TreeNode.new("0")
    expect(is_operator_in_tree?(root, "-")).must_equal(0)
  end

  it "An attempt to get number of instances of operator in tree returns false if tree is invalid (even if the specified operator character is in the invalid tree)" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(is_operator_in_tree?(root, "+")).must_equal(false)
  end

  it "Evaluates an infix-formatted tree" do
    root = TreeNode.new("+")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("%")
    root.left.left = TreeNode.new("*")
    root.left.right = TreeNode.new("2")
    root.left.left.left = TreeNode.new("4")
    root.left.left.right = TreeNode.new("3")
    root.right.left = TreeNode.new("10")
    root.right.right = TreeNode.new("5")
    expect(evaluate(root)).must_equal(14)

    root = TreeNode.new("0")
    expect(evaluate(root)).must_equal(0)

    root = TreeNode.new("1")
    expect(evaluate(root)).must_equal(1)
  end

  it "Returns false if attempting to evaluate an invalid infix tree" do
    root = TreeNode.new("-")
    root.left = TreeNode.new("+")
    root.right = TreeNode.new("4")
    expect(evaluate(root)).must_equal(false)
  end
end
