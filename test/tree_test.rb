require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Tree do
  let (:tree) {Tree.new}

  def add_nodes(tree)
    tree.add(5)
    tree.add(3)
    tree.add(7)
    tree.add(27)
    tree.add(4)
  end

  it "add & find values" do
    tree.add(5)
    expect(tree.find(5)).must_equal true

    tree.add(15)
    expect(tree.find(15)).must_equal true

    tree.add(3)
    expect(tree.find(3)).must_equal true
  end

  it "can't find anything when the tree is empty" do
    expect(tree.find(50)).must_equal false
  end

  describe "inorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.inorder).must_equal []
    end

    it "will return the tree in order" do
      add_nodes(tree)

      expect(tree.inorder).must_equal [3, 4, 5, 7, 27]
    end
  end


  describe "preorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.preorder).must_equal []
    end

    it "will return the tree in preorder" do
      add_nodes(tree)

      expect(tree.preorder).must_equal [5, 3, 4, 7, 27]
    end
  end

  describe "postorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.postorder).must_equal []
    end

    it "will return the tree in postorder" do
      add_nodes(tree)

      expect(tree.postorder).must_equal [4, 3, 27, 7, 5]
    end
  end

  describe "breadth first search" do
    it "will give an empty array for an empty tree" do
      expect(tree.bfs).must_equal []
    end

    it "will return an array of a level-by-level output of the tree" do
      add_nodes(tree)
      expect(tree.bfs).must_equal [5, 3, 7, 4, 27]
    end
  end

  describe "height" do
    it "will return 0 for an empty tree" do
      expect(tree.height).must_equal 0
    end

    it "will return the height for a given tree" do
      tree.add(5)
      expect(tree.height).must_equal 1

      tree.add(10)
      expect(tree.height).must_equal 2

      tree.add(20)
      expect(tree.height).must_equal 3

      tree.add(2)
      expect(tree.height).must_equal 3

      tree.add(3)
      expect(tree.height).must_equal 3

      tree.add(4)
      expect(tree.height).must_equal 4
    end
end