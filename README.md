# Tree Practice

## Creating a binary tree on paper
On paper, create a binary search tree to represent the expressions below.
1. `3 + 2`
2. `3 + 2 - 10`
3. `4 * 3 + 2`
4. `4 * 3 + 2 - 10 % 5`

## Creating a binary manually tree with nodes
1. Take a look at [`tree-practice.rb`](tree-practice.rb)
2. Let's walk through how `3 + 2` was created as a binary tree.
3. Let's walk through how `print_infix` works.
4. Create `4 * 3 + 2 - 10 % 5` in code as a binary tree.

## Pseudocode new tree methods
1. Let's write a method that prints out all the operators that exist in the tree. _Added Fun: If there are duplicate operators, don't print them separately, but instead print a tally of all operators found._
2. Write a method that returns the count of non-operators (in this case, leaves) in the tree. _Added Fun: print the level of the tree that each leaf appears on._
3. Write methods to print the tree in prefix and postfix notations.
4. Write a method that returns whether or not a given operator exists in the tree. _Added fun: If the operator occurs more than once, return the count on how many times it occurs - you may return 0 if it doesn't exist in the tree._
5. _Added Fun: Evaluate an infix binary tree._

## TDD
1. Come up with at least 3 test cases for problems 1-4 above. _Added Fun: #5 too._

## Code
1. Code out solutions for problems 1-4 above. _Added Fun: #5 too._
