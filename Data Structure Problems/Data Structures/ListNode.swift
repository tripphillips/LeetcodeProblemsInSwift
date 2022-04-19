//
//  ListNode.swift
//  Leetcode Problems In Swift
//
//  Created by Trip Phillips on 4/19/22.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
    }
    
    public init(_ val: Int) {
        self.val = val
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}
