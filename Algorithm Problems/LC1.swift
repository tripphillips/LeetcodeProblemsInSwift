//
//  LC1.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/16/22.
//

// 1. Two Sum
//
// Easy
//
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

import Foundation

class LC1Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var numDict = Dictionary<Int, Int>()
        
        for (index, num) in nums.enumerated() {
            
            if let complementNumIndex = numDict[target - num] {
                if nums[complementNumIndex] + num == target {
                    return [complementNumIndex, index]
                }
            } else {
                numDict[num] = index
            }
            
        }
        
        return [-1, -1]
    }
}
