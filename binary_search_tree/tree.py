from unittest.mock import NonCallableMagicMock


class TreeNode:
    def __init__(self, key, val = None):
        if val == None:
            val = key

        self.key = key
        self.value = val
        self.left = None
        self.right = None
        


class Tree:
    def __init__(self):
        self.root = None

    # Time Complexity:O(log n) if balanced 
    # Space Complexity: O(1)
    def add(self, key, value = None):
        node = TreeNode(key, value)
        if self.root is None:
            self.root = node
            return 
        current = self.root

        while current:
            if current.key > key:
            # go left
                if current.left is None:
                    # add node to the left
                    current.left = node
                    return  
                else:
                    current = current.left 
            else:
                # go right 
                if current.right is None:
                    # add node on right
                    current.right = node
                    return
                else:
                    current = current.right 

    # Time Complexity: O(log n)
    # Space Complexity: O(1)
    def find(self, key):
        current = self.root
        
        while current != None:
            if current.key == key:
                return current.value
            elif key < current.key:
                current = current.left
            else:
                current = current.right
            

        return None


    def inorder_helper(self, current_node, items):
        if current_node is not None:
            self.inorder_helper(current_node.left, items)
            items.append({"key": current_node.key, "value": current_node.value})
            self.inorder_helper(current_node.right, items)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def inorder(self):
        # visit all nodes in left, then root, then all nodes in right
        items = []
        self.inorder_helper(self.root, items)
        # current = self.root
        # if current:
        #     items = self.inorder(current.left)
        #     items.append(current.value)
        #     items = items + self.inorder(current.right)
        return items

    def preorder_helper(self, current_node, items):
        if current_node is not None:
            items.append({"key": current_node.key, "value": current_node.value})
            self.preorder_helper(current_node.left, items)
            self.preorder_helper(current_node.right, items)

    # Time Complexity: O(n)
    # Space Complexity: O(n)     
    def preorder(self):
        # visit root node, then left nodes, then right nodes 
        items = []
        self.preorder_helper(self.root, items)

        return items 

    def postorder_helper(self, current_node, items):
        if current_node is not None:
            self.postorder_helper(current_node.left, items)
            self.postorder_helper(current_node.right, items)
            items.append({"key": current_node.key, "value": current_node.value})
    # Time Complexity: O(n)
    # Space Complexity: O(n)    
    def postorder(self):
        # visit all nodes on left, then all nodes on right, then root node 
        items = []
        self.postorder_helper(self.root, items)

        return items 
    

    def height_helper(self, current_node):
        if current_node is not None:
            height_left = self.height_helper(current_node.left)
            height_right = self.height_helper(current_node.right)
            return (max(height_left, height_right) +1)
        else:
            return 0 

    # Time Complexity: O(n)
    # Space Complexity: O(n)  
    def height(self):
        return self.height_helper(self.root)


#   # Optional Method
#   # Time Complexity: 
#   # Space Complexity: 
    def bfs(self):
        pass

        


#   # Useful for printing
    def to_s(self):
        return f"{self.inorder()}"
