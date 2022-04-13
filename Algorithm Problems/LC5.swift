//
//  LC5.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/12/22.
//

// 5. Longest Palindromic Substring
//
// Medium
//
// Given a string s, return the longest palindromic substring in s.

import Foundation

class LC5Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 && !s.isEmpty else { return s }
        
        let charArray = Array(s)
        var start = 0
        var end = 0
        
        for i in 0..<charArray.count-1 {
            
            // Odd length sub strings
            let oddLength = expandAroundCenter(charArray: charArray, left: i, right: i)
            
            // Even length sub strings
            let evenLength = expandAroundCenter(charArray: charArray, left: i, right: i+1)
            
            let length = max(oddLength, evenLength)
            
            if (length > end - start) {
                start = i - ((length - 1) / 2)
                end = i + (length/2)
            }
        }
        return String(charArray[start...(end)])
    }
    
    func expandAroundCenter(charArray: [Character], left: Int, right: Int) -> Int {
        var left = left
        var right = right
        
        while (left >= 0 && right < charArray.count && charArray[left] == charArray[right]) {
            left -= 1
            right += 1
        }
        
        return right - left - 1
    }
}
