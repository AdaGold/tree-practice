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

    # Time Complexity: 0(log(n)
    # Space Complexity: 0(1)
    def add(self, key, value = None):
        added = TreeNode(key, value)
        if not self.root:
            self.root = added

        parent = self.root
        while True:
            if added.key > parent.key:
                if not parent.right:
                    parent.right = added
                    return added
                else:
                    parent = parent.right
            elif added.key <= parent.key:
                if not parent.left:
                    parent.left = added
                    return added
                else:
                    parent = parent.left
            else:
                return "something went wrong"


    # Time Complexity: 0(log(n))
    # Space Complexity: 0(1)
    def find(self, key):
        current = self.root
        while current:
            if key == current.key:
                return current.value
            elif key <= current.key:
                current = current.left
            elif key > current.key:
                current = current.right

        return None

    def inorder_helper(self, current, nodes = None):
        if nodes is None:
            nodes = []
        if current:
            self.inorder_helper(current.left, nodes)
            nodes.append({
                "key": current.key,
                "value": current.value
            })
            self.inorder_helper(current.right, nodes)
        return nodes

    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def inorder(self):
        return self.inorder_helper(self.root)

    def preorder_helper(self, current, nodes = None):
        if nodes is None:
            nodes = []
        if current:
            nodes.append({
                "key": current.key,
                "value": current.value
            })
            self.preorder_helper(current.left, nodes)
            self.preorder_helper(current.right, nodes)
        return nodes

    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def preorder(self):
        return self.preorder_helper(self.root)

    def postorder_helper(self, current, nodes = None):
        if nodes is None:
            nodes = []
        if current:
            self.postorder_helper(current.left, nodes)
            self.preorder_helper(current.right, nodes)
            nodes.append({
                "key": current.key,
                "value": current.value
            })
        return nodes

    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def postorder(self):
        return self.postorder_helper(self.root)

    def height_helper(self, current, nodes = None):
        if nodes is None:
            nodes = []
        if current:
            self.height_helper(current.left, nodes)
            if current.left is None and current.right is None:
                nodes.append(current.key)
            self.height_helper(current.right, nodes)
        return nodes

    def get_count(self, key):
        current = self.root
        count = 0
        while current:
            count += 1
            if key == current.key:
                return count
            elif key > current.key:
                current = current.right
            elif key < current.key:
                current = current.left
        return None

    # Time Complexity: O(nlog(n))
    # Space Complexity: 0(m) -> m == # of nodes
    def height(self):
        ends = self.height_helper(self.root)
        max = 0
        for end in ends:
            height = self.get_count(end)
            if height > max:
                max = height
        return max

#   # Optional Method
#   # Time Complexity: 
#   # Space Complexity: 
    def bfs(self):
        pass

#   # Useful for printing
    def to_s(self):
        return f"{self.inorder()}"
