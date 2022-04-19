//
//  LC21.swift
//  Leetcode Problems In Swift
//
//  Created by Trip Phillips on 4/19/22.
//

// 21. Merge Two Sorted Lists
//
// Easy
//
// You are given the heads of two sorted linked lists list1 and list2.
// Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
// Return the head of the merged linked list.

import Foundation

class LC21SolutionIterative {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        var root1 = list1
        var root2 = list2
        
        let head: ListNode = ListNode(-1)
        var tail: ListNode? = head
        
        while root1 != nil && root2 != nil {
            
            if root1!.val < root2!.val {
                tail?.next = root1
                root1 = root1?.next
            } else {
                tail?.next = root2
                root2 = root2?.next
            }
            
            tail = tail?.next
        }
        
        tail?.next = root1 != nil ? root1 : root2
        
        return head.next
    }
}

class LC21SolutionRecursive {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
        
    }
}
