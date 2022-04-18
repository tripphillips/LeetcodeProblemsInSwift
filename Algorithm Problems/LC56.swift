//
//  LC56.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/18/22.
//

// 56. Merge Intervals
//
// Medium
//
// Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals,
// and return an array of the non-overlapping intervals that cover all the intervals in the input.

import Foundation

class LC56Solution {
    func imperativeMerge(_ intervals: [[Int]]) -> [[Int]] {
        
        guard intervals.count > 1 else { return intervals }
        
        var mergedIntervals = [[Int]]()
        
        let sortedIntervals = intervals.sorted { (first, next) in (first.first ?? 0) < (next.first ?? 0) }
        
        mergedIntervals.append(sortedIntervals.first ?? [0,0])
        
        for index in 1..<sortedIntervals.count {
            
            let prevStart = mergedIntervals.last?.first ?? 0
            let prevEnd = mergedIntervals.last?.last ?? 0
            let currStart = sortedIntervals[index].first ?? 0
            let currEnd = sortedIntervals[index].last ?? 0
            
            if prevEnd >= currStart && prevEnd <= currEnd {
                let newEntry = [prevStart, currEnd]
                mergedIntervals.removeLast()
                mergedIntervals.append(newEntry)
            } else if prevEnd < currEnd {
                mergedIntervals.append(sortedIntervals[index])
            }
        }
        
        return mergedIntervals
    }
    
    func functionalMerge(_ intervals: [[Int]]) -> [[Int]] {
        return intervals
            .sorted(by: { $0[0] < $1[0] })
            .reduce(into:[]) {
                if let head = $0.last,
                   $1[0] <= head[1] {
                    $0.removeLast()
                    $0.append([head[0], max(head[1], $1[1])])
                } else {
                    $0.append($1)
                }
        }
    }
}
