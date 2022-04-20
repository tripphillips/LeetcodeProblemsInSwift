//
//  LC844.swift
//  Leetcode Problems In Swift
//
//  Created by Trip Phillips on 4/20/22.
//

// 844. Backspace String Compare
//
// Easy
//
// Given two strings s and t, return true if they are equal when both are typed into empty text editors.
// '#' means a backspace character.
// Note that after backspacing an empty text, the text will continue empty.

import Foundation

class LC844Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        
        //Make s and t arrays for easy access
        var sArr = [Character](s)
        var tArr = [Character](t)
        
        //Start at end of largest string
        let isSLargest = sArr.count > tArr.count
        
        var i = (isSLargest ? sArr.count : tArr.count) - 1
        
        // Keep track of whether or not we need to backspace
        var removeNextSChar = 0
        var removeNextTChar = 0
        
        while i >= 0 {
            performBackspaceIfNeeded(&sArr, removeNextChar: &removeNextSChar, i: i)
            performBackspaceIfNeeded(&tArr, removeNextChar: &removeNextTChar, i: i)
            i -= 1
        }
        
        if sArr.count != tArr.count {
            return false
        }
        
        for i in 0..<sArr.count {
            if sArr[i] != tArr[i] {
                return false
            }
        }
        
        return true
    }
    
    func performBackspaceIfNeeded(_ array: inout [Character], removeNextChar: inout Int, i: Int) {
        if i <= array.count - 1 {
            let char = array[i]
            if char == "#" {
                removeNextChar += 1
                array.remove(at: i)
            } else {
                if removeNextChar > 0 {
                    array.remove(at: i)
                    removeNextChar -= 1
                }
            }
        }
    }
}
