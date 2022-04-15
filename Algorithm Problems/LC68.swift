//
//  LC68.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/15/22.
//

// 68. Text Justification
//
// Hard
//
// Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
//
// You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
//
// Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
//
// For the last line of text, it should be left-justified and no extra space is inserted between words.
//
// Note:
//
// A word is defined as a character sequence consisting of non-space characters only.
// Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
// The input array words contains at least one word.


import Foundation

class LC68Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        
        var formattedStr = [String]()
        
        var potentialLineWords = words
        
        while potentialLineWords.count > 0 {
            
            var lineWords = [String]()
            var wordsLength = 0
            var nextPotentialWord: String? = potentialLineWords.first
            
            while nextPotentialWord != nil {
                if let word = nextPotentialWord {
                    
                    let neededSpaces = lineWords.count - 1
                    
                    // If the current word count + current words length + needed spaces < maxWidth, build line.
                    if word.count + wordsLength + neededSpaces < maxWidth {
                        
                        // Add word to lines.
                        lineWords.append(word)
                        
                        // Update words length.
                        wordsLength += word.count
                        
                        // Remove from potentialWords.
                        potentialLineWords.removeFirst()
                        
                        // Set next word to the next word in potentialLineWords.
                        nextPotentialWord = potentialLineWords.first
                    } else {
                        // The line is too long so we stop building.
                        nextPotentialWord = nil
                    }
                }
            }
            
            // Create new line
            var newLineStr = ""
            
            // Needed spaces is the amount of line words - 1. If lineWords contains only 1 word this is 0.
            let neededSpaces = max(lineWords.count - 1, 0)
            
            var spaceCount = maxWidth - wordsLength
            
            // At end of words
            if potentialLineWords.isEmpty {
                
                newLineStr += lineWords.joined(separator: " ")
                newLineStr += String(repeating: " ", count: spaceCount - neededSpaces)
                
            } else if lineWords.count == 1 { // add word at front followed by spaces
                
                newLineStr += lineWords.first ?? ""
                newLineStr += String(repeating: " ", count: spaceCount)
                
            } else { // add word more spaces where needed
                
                var spaceIndex = 0
                
                while spaceCount > 0 {
                    lineWords[spaceIndex] += " "
                    spaceCount -= 1
                    if spaceIndex + 1 < neededSpaces {
                        spaceIndex += 1
                    } else {
                        spaceIndex = 0
                    }
                }
                
                newLineStr += lineWords.joined(separator: "")
            }
            
            // add new line str to formattedStr
            formattedStr.append(newLineStr)
        }
        return formattedStr
    }
    
}
