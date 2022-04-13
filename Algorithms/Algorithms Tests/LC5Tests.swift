//
//  LC5Tests.swift
//  AlgorithmsTests
//
//  Created by Trip Phillips on 4/12/22.
//

import XCTest

class LC5Tests: XCTestCase {

    var sut: LC5Solution!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LC5Solution()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testEmptyStr() {
        let str = ""
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "")
    }
    
    func testSingleCharStr() {
        let str = "a"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "a")
    }

    func testValidPalidromeStr() {
        let str = "bab"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "bab")
    }
    
    func testInvalidPalindromeStr() {
        let str = "abc"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "b")
    }
    
    func testTwoValidPalindromesStr() {
        let str = "aabbb"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "bbb")
    }
    
    func testTwoValidPalindromeStr2() {
        let str = "aaabb"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "aaa")
    }
    
    func testMultValidPalindromeStr() {
        let str = "abaccccac"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "acccca")
    }
    
    func testMultValidPalindromeStr2() {
        let str = "abchannahahahahahcococ"
        let result = sut.longestPalindrome(str)
        XCTAssertEqual(result, "hahahahah")
    }
    
}
