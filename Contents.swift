import UIKit
import Foundation


// The value of the right node must be higher than the value of the left node, as well as the parent node.
// Tree from the book
/*
           40
          /   \
         18    77
        / \     / \
       1  20   70 105
      /    \   /     \
     0     25 45      88
 */
class BSTNode<Int> {
    
    var value: Int
    var leftNode: BSTNode?
    var rightNode: BSTNode?
    
    init(value: Int,
         leftNode: BSTNode? = nil,
         rightNode: BSTNode? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}
// BST's can only hold values that are comparable

struct BinarySearchTree<Int: Comparable> {
    
    var root: BSTNode<Int>?
    
    init() {}
        
    }
    
extension BinarySearchTree: CustomStringConvertible {
        public var description: String {
            guard let root = root else {return "empty tree"}
            return String(describing: root)
        }
    }


// We will use two different insert functions
// One will be exposed to users and the otherone will be used as a private

extension BinarySearchTree {
    public mutating func insert(_ value: Int) {
        root = insert(from: root, value: value)
        
    }
    private func insert(from node: BSTNode<Int>?, value: Int) -> BSTNode<Int> {
        guard let node = node else {
            return BSTNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftchild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
        }
    }

