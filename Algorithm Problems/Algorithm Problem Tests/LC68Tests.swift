//
//  LC68Tests.swift
//  AlgorithmsTests
//
//  Created by Trip Phillips on 4/15/22.
//

import XCTest

class LC68Tests: XCTestCase {

    var sut: LC68Solution!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LC68Solution()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testEmptyWords() {
        
        let words = [String]()
        let maxWidth = 10
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, [])
    }
    
    func testOneWordLessThanWidth() {
        let words = ["hello"]
        let maxWidth = 10
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello     "])
    }
    
    func testTwoWordLessThanWidth() {
        let words = ["hello", "again"]
        let maxWidth = 10
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello     ", "again     "])
    }

    func testThreeWordLessThanWidth() {
        let words = ["hello", "again", "hello"]
        let maxWidth = 10
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello     ", "again     ", "hello     "])
    }
    
    func testOneWordMaxWidth() {
        let words = ["hello"]
        let maxWidth = 5
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello"])
    }
    
    func testTwoWordsMaxWidth() {
        let words = ["hello", "again"]
        let maxWidth = 5
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello", "again"])
    }

    func testThreeWordsMaxWidth() {
        let words = ["hello", "again", "hello"]
        let maxWidth = 5
        
        let result = sut.fullJustify(words, maxWidth)
        XCTAssertEqual(result, ["hello", "again", "hello"])
    }
    
    func testFromLeetcode1() {
        let words = ["This", "is", "an", "example", "of", "text", "justification."]
        let maxWidth = 16
        
        let result = sut.fullJustify(words, maxWidth)
        
        for line in result {
            XCTAssertEqual(line.count, maxWidth, line)
        }
        
        XCTAssertEqual(result, [
            "This    is    an",
            "example  of text",
            "justification.  "
         ])
    }
    
    func testFromLeetcode2() {
        let words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
        let maxWidth = 20
        
        let result = sut.fullJustify(words, maxWidth)
        
        for line in result {
            XCTAssertEqual(line.count, maxWidth, line)
        }
        
        XCTAssertEqual(result, [
            "Science  is  what we",
            "understand      well",
            "enough to explain to",
            "a  computer.  Art is",
            "everything  else  we",
            "do                  "
          ])
    }
}
