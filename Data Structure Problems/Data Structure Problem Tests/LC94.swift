//
//  LC94.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/13/22.
//

// 94. Binary Tree Inorder Traversal
//
// Easy
//
// Given the root of a binary tree, return the inorder traversal of its nodes' values.
//

import Foundation

class LC94SolutionRecursive {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        guard root != nil else { return [] }
        
        var array = [Int]()
        
        buildTreeArray(root, &array)
        
        return array
    }
    
    func buildTreeArray(_ root: TreeNode?, _ array: inout [Int]) {
        guard root != nil else { return }
        
        buildTreeArray(root?.left, &array)
        array.append(root!.val)
        buildTreeArray(root?.right, &array)
    }
}

class LC94SolutionIterative {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }

        var root = root
        var stack = [TreeNode]()
        var array = [Int]()
        
        while !stack.isEmpty || root != nil {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            
            root = stack.removeLast()
            array.append(root!.val)
            root = root?.right
        }
         
        return array
    }
}
