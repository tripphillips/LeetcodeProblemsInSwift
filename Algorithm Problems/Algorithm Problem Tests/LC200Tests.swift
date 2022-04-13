//
//  LC200Tests.swift
//  DataStructuresTests
//
//  Created by Trip Phillips on 4/11/22.
//

import XCTest

class LC200Tests: XCTestCase {
    
    var sut: LC200Solution!
    
    override func setUpWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = LC200Solution()
    }
    
    override func tearDownWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = nil
    }
    
    func testEmptyGrid() {
        let emptyGrid = [[Character]]()
        let result = sut.numIslands(emptyGrid)
        XCTAssertEqual(result, 0)
    }
    
    func testOneRowEmptyGrid() {
        let oneRowEmptyGrid: [[Character]] = [
            ["0","0","0","0","0","0"]
        ]
        
        let result = sut.numIslands(oneRowEmptyGrid)
        XCTAssertEqual(result, 0)
    }
    
    func testOneColEmptyGrid() {
        let oneColEmptyGrid: [[Character]] = [
            ["0"],
            ["0"],
            ["0"],
            ["0"],
            ["0"],
            ["0"]
        ]
        
        let result = sut.numIslands(oneColEmptyGrid)
        XCTAssertEqual(result, 0)
    }
    
    func testOneRowOneIslandGrid() {
        let oneRowOneIslandGrid: [[Character]] = [
            ["1","1","1","1","1","1"]
        ]
        
        let result = sut.numIslands(oneRowOneIslandGrid)
        XCTAssertEqual(result, 1)
    }
    
    func testOneColOneIslandGrid() {
        let oneColOneIslandGrid: [[Character]] = [
            ["1"],
            ["1"],
            ["1"],
            ["1"],
            ["1"],
            ["1"]
        ]
        
        let result = sut.numIslands(oneColOneIslandGrid)
        XCTAssertEqual(result, 1)
    }
    
    func testOneIslandGridEvenRowsCols() {
        let oneIslandGridEqualRowsCols: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
        ]
        
        let result = sut.numIslands(oneIslandGridEqualRowsCols)
        XCTAssertEqual(result, 1)
    }
    
    func testTwoIslandGridEvenRowsCols() {
        let twoIslandGridEqualRowsCols: [[Character]] = [
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
        ]
        
        let result = sut.numIslands(twoIslandGridEqualRowsCols)
        XCTAssertEqual(result, 2)
    }
    
    func testThreeIslandGridEvenRowsCols() {
        let threeIslandGridEqualRowsCols: [[Character]] = [
            ["1", "1", "0", "1", "1"],
            ["1", "1", "0", "1", "1"],
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "1", "1"],
            ["1", "1", "0", "1", "1"],
        ]
        
        let result = sut.numIslands(threeIslandGridEqualRowsCols)
        XCTAssertEqual(result, 3)
    }
    
    func testOneIslandGridDifferentRowsCols() {
        let oneIslandGridDifferentRowsCols: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
            ["1", "1", "1", "1", "0"],
        ]
        
        let result = sut.numIslands(oneIslandGridDifferentRowsCols)
        XCTAssertEqual(result, 1)
    }
    
    func testTwoIslandGridDifferentRowsCols() {
        let twoIslandGridDifferentRowsCols: [[Character]] = [
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "1", "0"],
        ]
        
        let result = sut.numIslands(twoIslandGridDifferentRowsCols)
        XCTAssertEqual(result, 2)
    }
    
    func testThreeIslandGridDifferentRowsCols() {
        let twoIslandGridDifferentRowsCols: [[Character]] = [
            ["1", "1", "0", "1", "1"],
            ["1", "1", "0", "1", "1"],
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "1", "1"],
        ]
        
        let result = sut.numIslands(twoIslandGridDifferentRowsCols)
        XCTAssertEqual(result, 3)
    }
}
