import pytest
from binary_search_tree.tree import Tree


@pytest.fixture()
def empty_tree() -> Tree():
    return Tree()


@pytest.fixture()
def tree_with_nodes(empty_tree) -> Tree():
    empty_tree.add(5, "Peter")
    empty_tree.add(3, "Paul")
    empty_tree.add(1, "Mary")
    empty_tree.add(10, "Karla")
    empty_tree.add(15, "Ada")
    empty_tree.add(25, "Kari")

    return empty_tree


def test_find_returns_none_for_empty_tree(empty_tree):
    assert empty_tree.find(5) == None


def test_can_find_single_root_node(empty_tree):
    empty_tree.add(25, "Kari")
    assert empty_tree.find(25) == "Kari"


def test_add_and_find(tree_with_nodes):
    assert tree_with_nodes.find(5) == "Peter"
    assert tree_with_nodes.find(15) == "Ada"
    assert tree_with_nodes.find(3) == "Paul"

#
def test_can_find_leaf_nodes(tree_with_nodes):
    assert tree_with_nodes.find(1) == "Mary"
    assert tree_with_nodes.find(25) == "Kari"
    tree_with_nodes.add(13, "Alicia")
    assert tree_with_nodes.find(13) == "Alicia"


def test_find_returns_none_for_values_not_in_tree(tree_with_nodes):
    assert tree_with_nodes.find(6) == None


def test_inorder_with_empty_tree(empty_tree):
    answer = empty_tree.inorder()
    assert empty_tree.inorder() == []


def test_inorder_with_nodes(tree_with_nodes):
    expected_answer = [
        {
            "key": 1,
            "value": "Mary"
        },
        {
            "key": 3,
            "value": "Paul"
        },
        {
            "key": 5,
            "value": "Peter"
        },
        {
            "key": 10,
            "value": "Karla"
        },
        {
            "key": 15,
            "value": "Ada"
        },
        {
            "key": 25,
            "value": "Kari"
        }
    ]

    answer = tree_with_nodes.inorder()
    assert answer == expected_answer


def test_preorder_on_empty_tree(empty_tree):
    assert empty_tree.preorder() == []


def test_preorder_on_tree_with_nodes(tree_with_nodes):
    expected_answer = [
        {
            "key": 5,
            "value": "Peter"
        },
        {
            "key": 3,
            "value": "Paul"
        },
        {
            "key": 1,
            "value": "Mary"
        },
        {
            "key": 10,
            "value": "Karla"
        },
        {
            "key": 15,
            "value": "Ada"
        },
        {
            "key": 25,
            "value": "Kari"
        }
    ]

    answer = tree_with_nodes.preorder()
    assert answer == expected_answer


def test_postorder_on_empty_tree(empty_tree):
    assert empty_tree.postorder() == []


def test_postorder_on_tree_with_nodes(tree_with_nodes):
    expected_answer = [
        {
            "key": 1,
            "value": "Mary"
        },
        {
            "key": 3,
            "value": "Paul"
        },
        {
            "key": 25,
            "value": "Kari"
        },
        {
            "key": 15,
            "value": "Ada"
        },
        {
            "key": 10,
            "value": "Karla"
        },
        {
            "key": 5,
            "value": "Peter"
        }
    ]

    answer = tree_with_nodes.postorder()
    assert answer == expected_answer

def test_height_of_empty_tree_is_zero(empty_tree):
    assert empty_tree.height() == 0


def test_height_of_one_node_tree(empty_tree):
    empty_tree.add(5, "pasta")
    assert empty_tree.height() == 1


def test_height_of_many_node_tree(tree_with_nodes):
    assert tree_with_nodes.height() == 4
    tree_with_nodes.add(2, "pasta")
    tree_with_nodes.add(2.5, "bread")
    assert tree_with_nodes.height() == 5


def test_will_report_height_of_balanced_tree():
    balanced_tree = Tree()
    balanced_tree.add(5, "Peter")
    balanced_tree.add(3, "Paul")
    balanced_tree.add(4, "Kate")
    balanced_tree.add(1, "Mary")
    balanced_tree.add(10, "Karla")
    balanced_tree.add(8, "Ada")
    balanced_tree.add(25, "Kari")

    assert balanced_tree.height() == 3


def test_will_report_height_of_unbalanced_tree():
    unbalanced_tree = Tree()
    unbalanced_tree.add(100, "Peter")
    unbalanced_tree.add(110, "Paul")
    unbalanced_tree.add(120, "Kate")
    unbalanced_tree.add(130, "Mary")
    unbalanced_tree.add(140, "Karla")

    assert unbalanced_tree.height() == 5

    unbalanced_tree = Tree()
    unbalanced_tree.add(140, "Peter")
    unbalanced_tree.add(130, "Paul")
    unbalanced_tree.add(120, "Kate")
    unbalanced_tree.add(110, "Mary")
    unbalanced_tree.add(100, "Karla")

    assert unbalanced_tree.height() == 5
#
#
# def test_bfs_with_empty_tree(empty_tree):
#     assert empty_tree.bfs() == []
#
#
# def test_bfs_with_tree_with_nodes(tree_with_nodes):
#     expected_answer = [
#         {
#             "key": 5,
#             "value": "Peter"
#         },
#         {
#             "key": 3,
#             "value": "Paul"
#         },
#         {
#             "key": 10,
#             "value": "Karla"
#         },
#         {
#             "key": 1,
#             "value": "Mary"
#         },
#         {
#             "key": 15,
#             "value": "Ada"
#         },
#         {
#             "key": 25,
#             "value": "Kari"
#         }
#     ]
#
#     answer = tree_with_nodes.bfs()
#     assert answer == expected_answer
