
require_relative "test_helper"


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Tree do
  let (:tree) {Tree.new}

  let (:tree_with_nodes) {
    tree.add(5, "Peter")
    tree.add(3, "Paul")
    tree.add(1, "Mary")
    tree.add(10, "Karla")
    tree.add(15, "Ada")
    tree.add(25, "Kari")
    tree
  }

  describe "add and find" do 
    it "add & find values" do
      tree.add(5, "Peter")
      expect(tree.find(5)).must_equal "Peter"

      tree.add(15, "Ada")
      expect(tree.find(15)).must_equal "Ada"

      tree.add(3, "Paul")
      expect(tree.find(3)).must_equal "Paul"
    end

    it "can't find anything when the tree is empty" do
      expect(tree.find(50)).must_be_nil
    end
  end

  describe "inorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.inorder).must_equal []
    end

    it "will return the tree in order" do
      expect(tree_with_nodes.inorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                       {:key=>5, :value=>"Peter"}, {:key=>10, :value=>"Karla"}, 
                                       {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end


  describe "preorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.preorder).must_equal []
    end

    it "will return the tree in preorder" do
      expect(tree_with_nodes.preorder).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                        {:key=>1, :value=>"Mary"}, {:key=>10, :value=>"Karla"}, 
                                        {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end

  describe "postorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.postorder).must_equal []
    end

    it "will return the tree in postorder" do
      expect(tree_with_nodes.postorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                         {:key=>25, :value=>"Kari"}, {:key=>15, :value=>"Ada"}, 
                                         {:key=>10, :value=>"Karla"}, {:key=>5, :value=>"Peter"}]
    end
  end

  describe "breadth first search" do
    it "will give an empty array for an empty tree" do
      expect(tree.bfs).must_equal []
    end

    it "will return an array of a level-by-level output of the tree" do
      expect(tree_with_nodes.bfs).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                   {:key=>10, :value=>"Karla"}, {:key=>1, :value=>"Mary"}, 
                                   {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end
  
  describe "height" do 
    it "will return 0 if tree is empty" do 
      expect(tree.height()).must_equal 0
    end

    it "will return the nuber of nodes in the longest path" do
      expect(tree_with_nodes.height).must_equal 4
      tree_with_nodes.add(60, "sam")
      tree_with_nodes.add(58, "penny")
      tree_with_nodes.add(65, "sam")
      expect(tree_with_nodes.height).must_equal 6
    end
    
    it "will give the correct height of a binary search tree" do
      tree_with_nodes.add(30, "Tatiana")
      expect(tree_with_nodes.height).must_equal 5
    end
  end

  describe "delete" do
    it "can delete a note in the tree" do
      # Arrange & Assert
      expect(tree_with_nodes.find(15)).must_equal "Ada"

      # Act
      tree_with_nodes.delete(15)

      # Assert
      expect(tree_with_nodes.find(15)).must_be_nil
    end

    it "will return nil if the node is not in the tree when it's deleted" do
      # Arrange & Act
      answer = tree_with_nodes.delete(47)

      # Assert
      expect(answer).must_be_nil
      expect(tree_with_nodes.find(47)).must_be_nil
    end

  end
end
