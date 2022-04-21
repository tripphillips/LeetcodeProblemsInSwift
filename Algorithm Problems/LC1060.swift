//
//  LC1060.swift
//  Leetcode Problems In Swift
//
//  Created by Trip Phillips on 4/21/22.
//

// 1060. Missing Element in Sorted Array
//
// Medium
//
// Given an integer array nums which is sorted in ascending order and all of its elements are unique
// and given also an integer k, return the kth missing number starting from the leftmost number of the array.

import Foundation

class LC1060Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {

        guard !nums.isEmpty else { return -1 }
        
        let n = nums.count
        
        if k > missing(at: n - 1, nums: nums) {
            return nums[n - 1] + k - missing(at: n - 1, nums: nums)
        }
        
        var left = 0
        var right = n - 1
        var middle = 0
        
        while left != right {
            middle = left + (right - left) / 2
            
            if missing(at: middle, nums: nums) < k {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return nums[left - 1] + k - missing(at: left - 1, nums: nums)
    }
    
    private func missing(at index: Int, nums: [Int]) -> Int {
        return nums[index] - nums[0] - index
    }
}
