//
//  LC105.swift
//
// 105. Construct Binary Tree from Preorder and Inorder Traversal
//
// Given two integer arrays preorder and inorder where preorder is
// the preorder traversal of a binary tree and inorder is the inorder
// traversal of the same tree, construct and return the binary tree.
//
// Created by Trip Phillips on 4/7/22.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class LC105Solution {
    
    
    private var preorderIndex = -1
    
    // Keep track of inorder indexes
    private var inorderIndexDict = [Int: Int]()
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        // Base cases
        guard !preorder.isEmpty else { return nil }
        guard preorder.count > 1 else { return TreeNode(preorder[0]) }
        
        // start the preorderIndex off at 0
        preorderIndex = 0
        
        // Fill the inorderIndexDict
        for (index, num) in inorder.enumerated() {
            inorderIndexDict[num] = index
        }
        
        return convertArrayToTree(preorder, left: 0, right: preorder.count - 1)
    }
    
    func convertArrayToTree(_ preorder: [Int], left: Int, right: Int) -> TreeNode? {
        
        guard left <= right else { return nil }
        
        let rootVal = preorder[preorderIndex]
        preorderIndex += 1
        
        let root = TreeNode(rootVal)
        
        guard let rootValIndex = inorderIndexDict[rootVal] else { return nil }
        
        root.left = convertArrayToTree(preorder, left: left, right: rootValIndex - 1)
        
        root.right = convertArrayToTree(preorder, left: rootValIndex + 1, right: right)
        
        return root

    }
}
