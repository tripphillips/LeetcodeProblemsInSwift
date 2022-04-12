//
//  LC105Tests.swift
//  
//
//  Created by Trip Phillips on 4/7/22.
//

import XCTest

class LC105Tests: XCTestCase {

    var sut: LC105Solution!
    
    override func setUpWithError() throws {
        do {
            try super.setUpWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = LC105Solution()
    }

    override func tearDownWithError() throws {
        do {
            try super.tearDownWithError()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        sut = nil
    }

    func testBaseCaseEmpty() {
        let root = sut.buildTree([], [])
        var outputArray = [Int?]()
        traverse(root, outputArray: &outputArray)
        XCTAssertEqual(outputArray, [nil])
    }
    
    func testBaseCaseOne() {
        let root = sut.buildTree([-1], [-1])
        var outputArray = [Int?]()
        traverse(root, outputArray: &outputArray)
        outputArray.removeFirst()
        outputArray.removeLast()
        XCTAssertEqual(outputArray, [-1])
    }
    
    func testStandardCase1() {
        let root = sut.buildTree([3,9,20,15,7], [9,3,15,20,7])
        var outputArray = [Int?]()
        traverse(root, outputArray: &outputArray)
        XCTAssertEqual(outputArray, [3,9,20,nil,nil,15,7])
    }

    private func traverse(_ root: TreeNode?, outputArray: inout [Int?]) {
        guard root != nil else {
            outputArray.append(nil)
            return
        }
        outputArray.append(root?.val)
        _ = traverse(root?.left, outputArray: &outputArray)
        _ = traverse(root?.right, outputArray: &outputArray)
    }
    
    func testPerformanceEmpty() throws {
        // This is an example of a performance test case.
        self.measure {
            sut.buildTree([], [])
        }
    }

}
