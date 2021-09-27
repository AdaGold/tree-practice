class TreeNode:
    def __init__(self, key, val = None):
        if val == None:
            val = key

        self.key = key
        self.value = val
        self.left = None
        self.right = None

    def dict(self):
        return {"key": self.key, "value": self.value}    

class Tree:
    def __init__(self):
        self.root = None

    # Time Complexity: 0(log n)
    # Space Complexity: 0(log n)
    def add(self, key, value=None):
        node = TreeNode(key, value)
        if not self.root:
            self.root = node
            return 
        self.add_helper(self.root, node)

    def add_helper(self, current, new):
        if current == None:
            return new
        if new.key <= current.key:
            current.left = self.add_helper(current.left, new)
        else:
            current.right = self.add_helper(current.right, new)

        return current

    # Time Complexity: 0(log n)
    # Space Complexity: 0(log n)
    def find(self, key):
        return self.find_helper(self.root, key)

    def find_helper(self, current, key):
        if not current:
            return None
        if current.key == key:
            return current.value
        if current.key > key:
            return self.find_helper(current.left, key)
        elif current.key < key:
            return self.find_helper(current.right, key)

    def iterative_find(self, key):
        if self.root == None:
            return None

        current = self.root
        while current != None:
            if current.key == key:
                return current.value
            elif current.key < key:
                current = current.right
            else:
                current = current.left            

    # Time Complexity: 0(n)
    # Space Complexity: 0(n)
    def inorder(self):
        list = []
        self.inorder_helper(self.root, list)
        return list

    def inorder_helper(self, current, list):
        if current == None:
            return 
        self.inorder_helper(current.left, list)
        list.append(current.dict())
        self.inorder_helper(current.right, list)
        return        

    # Time Complexity: 0(n)
    # Space Complexity: 0(n)    
    def preorder(self):
        list = []
        self.preorder_helper(self.root, list)
        return list
        
    def preorder_helper(self, current, list):
        if current == None:
            return 
        current_dict = current.dict()    
        list.append(current.dict())
        self.preorder_helper(current.left, list)
        self.preorder_helper(current.right, list)        

    # Time Complexity: 0(n)
    # Space Complexity: 0(n)    
    def postorder(self):
        list = []
        self.postorder_helper(self.root, list)
        return list

    def postorder_helper(self, current, list):
        if current == None:
            return 
        self.postorder_helper(current.left, list)
        self.postorder_helper(current.right, list)
        list.append(current.dict())
        return  

    # Time Complexity: 0(n)
    # Space Complexity: 0(n)     
    def height(self):
        return self.height_helper(self.root)
        
    def height_helper(self, current): 
        if not current:
            return 0  
        height_left = self.height_helper(current.left)
        height_right = self.height_helper(current.right)
        return max(height_left, height_right) + 1 


#   # Optional Method
#   # Time Complexity: 
#   # Space Complexity: 
    def bfs(self):
        pass

        


#   # Useful for printing
    def to_s(self):
        return f"{self.inorder()}"
