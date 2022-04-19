//
//  TreeNode.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/13/22.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
    }
    
    public init(_ val: Int) {
        self.val = val
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
