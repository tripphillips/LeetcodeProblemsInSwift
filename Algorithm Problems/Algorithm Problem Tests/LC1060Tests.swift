//
//  LC1060Tests.swift
//  AlgorithmsTests
//
//  Created by Trip Phillips on 4/21/22.
//

import XCTest

class LC1060Tests: XCTestCase {

    var sut: LC1060Solution!
    
    override func setUpWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = LC1060Solution()
    }
    
    override func tearDownWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = nil
    }
    
    func test_missingElement_handlesEmptyNums() {
        let result = sut.missingElement([], 1)
        XCTAssertEqual(result, -1)
    }
    
    func test_missingElement_handlesOneNum() {
        let result = sut.missingElement([1], 1)
        XCTAssertEqual(result, 2)
    }
    
    func test_missingElement_handlesMultipleNums1() {
        let result = sut.missingElement([4,7,9,10], 1)
        XCTAssertEqual(result, 5)
    }
    
    func test_missingElement_handlesMultipleNums2() {
        let result = sut.missingElement([4,7,9,10], 3)
        XCTAssertEqual(result, 8)
    }
    
    func test_missingElement_handlesMultipleNums3() {
        let result = sut.missingElement([1,2,4], 3)
        XCTAssertEqual(result, 6)
    }
    
    func test_missingElement_handlesMultipleNums4() {
        let result = sut.missingElement([1,2,3,4,5,8], 1)
        XCTAssertEqual(result, 6)
    }
    
    func test_missingElement_handlesMultipleNums5() {
        let result = sut.missingElement([0,2,3,4,5,6,7,8], 1)
        XCTAssertEqual(result, 1)
    }
}
