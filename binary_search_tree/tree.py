class TreeNode:
    def __init__(self, key, val=None):
        if val == None:
            val = key

        self.key = key
        self.value = val
        self.left = None
        self.right = None


class Tree:
    def __init__(self):
        self.root = None

    # Time Complexity: O(log n)
    # Space Complexity: O(1)
    def add(self, key, value=None):
        new_tree_node = TreeNode(key, value)
        if not self.root:
            self.root = new_tree_node
            return
        return self.add_helper(self.root, new_tree_node)

    def add_helper(self, current_node, new_node):
        if current_node == None:
            return new_node
        else:
            if new_node.key <= current_node.key:
                current_node.left = self.add_helper(
                    current_node.left, new_node)
            else:
                current_node.right = self.add_helper(
                    current_node.right, new_node)
            return current_node

    # Time Complexity: O(log n)
    # Space Complexity: O(1)

    def find(self, key):
        return self.find_helper(self.root, key)

    def find_helper(self, current_node, key):
        if current_node == None:
            return None
        elif current_node.key == key:
            return current_node.value
        elif key < current_node.key:
            return self.find_helper(current_node.left, key)
        return self.find_helper(current_node.right, key)

    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def inorder(self):
        ordered_list = []
        self.inorder_helper(self.root, ordered_list)

        return ordered_list

    def inorder_helper(self, root, ordered_list):
        if not root:
            return
        self.inorder_helper(root.left, ordered_list)
        ordered_list.append({"key": root.key, "value": root.value})
        self.inorder_helper(root.right, ordered_list)

    # Time Complexity: O(n)
    # Space Complexity: O(n)

    def preorder(self):
        ordered_list = []
        self.preorder_helper(self.root, ordered_list)
        return ordered_list

    def preorder_helper(self, root, ordered_list):
        if not root:
            return
        ordered_list.append({"key": root.key, "value": root.value})
        self.preorder_helper(root.left, ordered_list)
        self.preorder_helper(root.right, ordered_list)

    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def postorder(self):
        ordered_list = []
        self.postorder_helper(self.root, ordered_list)
        return ordered_list

    def postorder_helper(self, root, ordered_list):
        if not root:
            return
        self.postorder_helper(root.left, ordered_list)
        self.postorder_helper(root.right, ordered_list)
        ordered_list.append({"key": root.key, "value": root.value})

    # Time Complexity: O(log n)
    # Space Complexity: O(1)

    def height(self):
        return self.height_helper(self.root)

    def height_helper(self, current_node):
        if current_node == None:
            return 0

        return max(self.height_helper(current_node.left), self.height_helper(current_node.right)) + 1

#   # Optional Method
#   # Time Complexity:
#   # Space Complexity:

    def bfs(self):
        pass


#   # Useful for printing

    def to_s(self):
        return f"{self.inorder()}"
