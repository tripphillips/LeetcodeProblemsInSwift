//
//  LC844Tests.swift
//  AlgorithmsTests
//
//  Created by Trip Phillips on 4/20/22.
//

import XCTest

class LC844Tests: XCTestCase {

    var sut: LC844Solution!
    
    override func setUpWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = LC844Solution()
    }
    
    override func tearDownWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = nil
    }
    
    func test_EmptyStrings() {
        let result = sut.backspaceCompare("", "")
        return XCTAssertEqual(result, true)
    }
    
    func test_UnBalancedStrings1() {
        let result = sut.backspaceCompare("a", "")
        return XCTAssertEqual(result, false)
    }
    
    func test_UnBalancedStrings2() {
        let result = sut.backspaceCompare("", "a")
        return XCTAssertEqual(result, false)
    }
    
    func test_UnBalancedStrings3() {
        let result = sut.backspaceCompare("aa", "b#bb")
        return XCTAssertEqual(result, false)
    }
    
    func test_UnBalancedStrings4() {
        let result = sut.backspaceCompare("c", "a##bbcc")
        return XCTAssertEqual(result, false)
    }
    
    func test_BalancedStrings1() {
        let result = sut.backspaceCompare("ccc", "cccc#")
        return XCTAssertEqual(result, true)
    }
    
    func test_BalancedStrings2() {
        let result = sut.backspaceCompare("aaa#aa#", "aaa")
        return XCTAssertEqual(result, true)
    }
    
    func test_BalancedStrings3() {
        let result = sut.backspaceCompare("aaa#aa#cccc", "aaacccc")
        return XCTAssertEqual(result, true)
    }

    func test_BalancedMoreSpaces() {
        let result = sut.backspaceCompare("aaa#aa#", "aaa#####")
        return XCTAssertEqual(result, false)
    }
}
