//
//  LC56Tests.swift
//  DataStructuresTests
//
//  Created by Trip Phillips on 4/18/22.
//

import XCTest

class LC56Tests: XCTestCase {

    var sut: LC56Solution!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LC56Solution()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testEmptyIntervals() {
        let intervals: [[Int]] = [[Int]]()
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[Int]]())
        XCTAssertEqual(result2, [[Int]]())
    }
    
    func testSingleInterval() {
        let intervals: [[Int]] = [[1,2]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,2]])
        XCTAssertEqual(result2, [[1,2]])
    }
    
    func testTwoNoOverlapIntervals() {
        let intervals: [[Int]] = [[1,2],[3,4]]
    
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,2],[3,4]])
        XCTAssertEqual(result2, [[1,2],[3,4]])
    }
    
    func testTwoOverlapIntervals() {
        let intervals: [[Int]] = [[1,2],[2,4]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,4]])
        XCTAssertEqual(result2, [[1,4]])
    }
    
    func testTwoOverlapIntervals2() {
        let intervals: [[Int]] = [[1,4],[2,3]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,4]])
        XCTAssertEqual(result2, [[1,4]])
    }
    
    func testThreeNoOverlapIntervals() {
        let intervals: [[Int]] = [[1,2],[3,4],[5,6]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result,  [[1,2],[3,4],[5,6]])
        XCTAssertEqual(result2,  [[1,2],[3,4],[5,6]])
    }
    
    func testThreeOverlapIntervals() {
        let intervals: [[Int]] = [[1,2],[2,4],[4,6]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,6]])
        XCTAssertEqual(result2, [[1,6]])
    }
    
    func testMultOverlapIntervals() {
        let intervals: [[Int]] = [[1,2],[2,3],[2,6],[7,8]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,6],[7,8]])
        XCTAssertEqual(result2, [[1,6],[7,8]])
    }
    
    func testMultOverlapIntervals2() {
        let intervals: [[Int]] = [[1,3],[2,6],[8,10],[15,18]]
        
        let result = sut.imperativeMerge(intervals)
        let result2 = sut.functionalMerge(intervals)
        XCTAssertEqual(result, [[1,6],[8,10],[15,18]])
        XCTAssertEqual(result2, [[1,6],[8,10],[15,18]])
    }
    
    // Functional appears to be slightly faster than imperative
    func testPerformance() {
        
        let intervals: [[Int]] = [[1,3],[2,6],[8,10],[15,18],[8,9],[10,15],[20,100]]
        
        self.measure {
            let _ = sut.functionalMerge(intervals)
            //let _ = sut.imperativeMerge(intervals)
        }
    }
}
