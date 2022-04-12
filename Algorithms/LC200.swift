//
//  LC200.swift
//  Algorithms
//
//  Created by Trip Phillips on 4/11/22.
//
// Medium
//
// 200. Number of Islands
// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
// You may assume all four edges of the grid are all surrounded by water.

import Foundation

struct GridPosition: Hashable {
    var row: Int
    var col: Int
    
    static func == (lhs: GridPosition, rhs: GridPosition) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
}

class LC200Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        guard !grid.isEmpty else { return 0 }
        
        var mutableGrid = grid
        
        var count = 0
        
        for i in 0..<mutableGrid.count {
            for j in 0..<mutableGrid[i].count {
                
                let currentPosition = GridPosition(row: i, col: j)
                
                if mutableGrid[currentPosition.row][currentPosition.col] == "1" {
                    count += 1
                    checkNeighbors(for: currentPosition, in: &mutableGrid)
                }
            }
        }
        
        return count
    }
    
    func checkNeighbors(for gridPosition: GridPosition, in grid: inout [[Character]]) {
     
        grid[gridPosition.row][gridPosition.col] = "0"
        
        // Up
        if gridPosition.row - 1 >= 0,
            grid[gridPosition.row - 1][gridPosition.col] == "1" {
            checkNeighbors(for: GridPosition(row: gridPosition.row - 1, col: gridPosition.col), in: &grid)
        }
        
        // Down
        if gridPosition.row + 1 < grid.count,
            grid[gridPosition.row + 1][gridPosition.col] == "1" {
            checkNeighbors(for: GridPosition(row: gridPosition.row + 1, col: gridPosition.col), in: &grid)
        }
        
        // Left
        if gridPosition.col - 1 >= 0,
            grid[gridPosition.row][gridPosition.col - 1] == "1" {
            checkNeighbors(for: GridPosition(row: gridPosition.row, col: gridPosition.col - 1), in: &grid)
        }
        
        // Right
        if gridPosition.col + 1 < grid[gridPosition.row].count,
            grid[gridPosition.row][gridPosition.col + 1] == "1" {
            checkNeighbors(for: GridPosition(row: gridPosition.row, col: gridPosition.col + 1), in: &grid)
        }
    }
}
