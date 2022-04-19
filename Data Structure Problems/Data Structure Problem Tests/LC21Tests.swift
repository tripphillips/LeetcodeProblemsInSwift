//
//  LC21Tests.swift
//  DataStructuresTests
//
//  Created by Trip Phillips on 4/19/22.
//

import XCTest

class LC21Tests: XCTestCase {

    var recursiveSut: LC21SolutionRecursive!
    var iterativeSut: LC21SolutionIterative!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        recursiveSut = LC21SolutionRecursive()
        iterativeSut = LC21SolutionIterative()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        recursiveSut = LC21SolutionRecursive()
        iterativeSut = LC21SolutionIterative()
    }

    func test_emptyL1L2_recursive() {
        let result = createRecursiveResult(l1: createNode(from: []), l2: createNode(from: []))
        XCTAssertEqual(result, [])
    }
    
    func test_emptyL1_recursive() {
        let result = createRecursiveResult(l1: createNode(from: []), l2: createNode(from: [2]))
        XCTAssertEqual(result, [2])
    }
    
    func test_emptyL2_recursive() {
        let result = createRecursiveResult(l1: createNode(from: [2]), l2: createNode(from: []))
        XCTAssertEqual(result, [2])
    }
    
    func test_EqualL1L2_recursive1() {
        let result = createRecursiveResult(l1: createNode(from: [2]), l2: createNode(from: [2]))
        XCTAssertEqual(result, [2,2])
    }
    
    func test_EqualL1L2_recursive2() {
        let result = createRecursiveResult(l1: createNode(from: [1,2]), l2: createNode(from: [1,2]))
        XCTAssertEqual(result, [1,1,2,2])
    }
    
    func test_EqualL1L2_recursive3() {
        let result = createRecursiveResult(l1: createNode(from: [1,2,3]), l2: createNode(from: [1,2,3]))
        XCTAssertEqual(result, [1,1,2,2,3,3])
    }
    
    func test_EqualL1L2_recursive4() {
        let result = createRecursiveResult(l1: createNode(from: [1,2,3,4]), l2: createNode(from: [1,2,3,4]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4])
    }
    
    func test_EqualL1L2_recursive5() {
        let result = createRecursiveResult(l1: createNode(from: [1,2,3,4,5]), l2: createNode(from: [1,2,3,4,5]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4,5,5])
    }
    
    func test_EqualL1L2_recursive6() {
        let result = createIterativeResult(l1: createNode(from: [1,2,3,4,5,6]), l2: createNode(from: [1,2,3,4,5,6]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4,5,5,6,6])
    }
    
    func test_emptyL1L2_iterative() {
        let result = createIterativeResult(l1: createNode(from: []), l2: createNode(from: []))
        XCTAssertEqual(result, [])
    }
    
    func test_emptyL1_iterative() {
        let result = createIterativeResult(l1: createNode(from: []), l2: createNode(from: [2]))
        XCTAssertEqual(result, [2])
    }
    
    func test_emptyL2_iterative() {
        let result = createIterativeResult(l1: createNode(from: [2]), l2: createNode(from: []))
        XCTAssertEqual(result, [2])
    }
    
    func test_EqualL1L2_iterative1() {
        let result = createIterativeResult(l1: createNode(from: [2]), l2: createNode(from: [2]))
        XCTAssertEqual(result, [2,2])
    }
    
    func test_EqualL1L2_iterative2() {
        let result = createIterativeResult(l1: createNode(from: [1,2]), l2: createNode(from: [1,2]))
        XCTAssertEqual(result, [1,1,2,2])
    }
    
    func test_EqualL1L2_iterative3() {
        let result = createIterativeResult(l1: createNode(from: [1,2,3]), l2: createNode(from: [1,2,3]))
        XCTAssertEqual(result, [1,1,2,2,3,3])
    }
    
    func test_EqualL1L2_iterative4() {
        let result = createIterativeResult(l1: createNode(from: [1,2,3,4]), l2: createNode(from: [1,2,3,4]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4])
    }
    
    func test_EqualL1L2_iterative5() {
        let result = createIterativeResult(l1: createNode(from: [1,2,3,4,5]), l2: createNode(from: [1,2,3,4,5]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4,5,5])
    }
    
    func test_EqualL1L2_iterative6() {
        let result = createIterativeResult(l1: createNode(from: [1,2,3,4,5,6]), l2: createNode(from: [1,2,3,4,5,6]))
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4,5,5,6,6])
    }
    
    private func createRecursiveResult(l1: ListNode?, l2: ListNode?) -> [Int] {
        let node = recursiveSut.mergeTwoLists(l1, l2)
        return createArray(from: node)
    }
    
    private func createIterativeResult(l1: ListNode?, l2: ListNode?) -> [Int] {
        let node = iterativeSut.mergeTwoLists(l1, l2)
        return createArray(from: node)
    }
    
    private func createNode(from array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        
        var head: ListNode?
        
        for elem in array.reversed() {
            head = ListNode(elem, head)
        }
        
        return head
    }
    
    private func createArray(from node: ListNode?) -> [Int] {
        guard node != nil else { return [] }
        var arr = [Int]()
        
        var currentNode = node
        
        while currentNode != nil {
            arr.append(currentNode!.val)
            currentNode = currentNode?.next
        }
        
        return arr
    }

}
