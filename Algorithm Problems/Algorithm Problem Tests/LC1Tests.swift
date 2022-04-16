//
//  LC1Tests.swift
//  AlgorithmsTests
//
//  Created by Trip Phillips on 4/16/22.
//

import XCTest

class LC1Tests: XCTestCase {

    var sut: LC1Solution!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LC1Solution()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func testEmptyNums() {
        let nums = [Int]()
        let target = 10
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [-1,-1])
    }
    
    func testSingleNums() {
        let nums = [1]
        let target = 10
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [-1,-1])
    }
    
    func testTwoNums() {
        let nums = [1,0]
        let target = 1
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [0,1])
    }
    
    
    func testTwoDuplicateNums() {
        let nums = [1,1]
        let target = 2
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [0,1])
    }

    func testIncreasingOrderNums() {
        let nums = [1,2,3,4,5,6,7]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [2,4])
    }

    func testDecreasingOrderNums() {
        let nums = [7,6,5,4,3,2,1]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [2,4])
    }

    func testRandomOrderNums() {
        let nums = [7,1,5,2,4,3,6]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [0,1])
    }
    
    func testIncreasingOrderDuplicateNums() {
        let nums = [1,2,2,3,4,5,6,6]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [3,5])
    }

    func testDecreasingOrderDuplicateNums() {
        let nums = [7,7,6,6,5,4,3,2,1]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [4,6])
    }

    func testRandomOrderDuplicateNums() {
        let nums = [7,1,5,2,4,3,3,3,6,6]
        let target = 8
        
        let result = sut.twoSum(nums, target)
        XCTAssertEqual(result, [0,1])
    }

}
