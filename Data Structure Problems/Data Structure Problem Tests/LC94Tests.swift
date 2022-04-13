//
//  LC94Tests.swift
//  DataStructuresTests
//
//  Created by Trip Phillips on 4/13/22.
//

import XCTest

class LC94Tests: XCTestCase {

    var recursiveSut: LC94SolutionRecursive!
    var iterativeSut: LC94SolutionIterative!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        recursiveSut = LC94SolutionRecursive()
        iterativeSut = LC94SolutionIterative()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        recursiveSut = LC94SolutionRecursive()
        iterativeSut = LC94SolutionIterative()
    }

    func testNilRoot() {
        
        let recursiveResult = recursiveSut.inorderTraversal(nil)
        let iterativeResult = iterativeSut.inorderTraversal(nil)
        
        XCTAssertEqual(recursiveResult, [])
        XCTAssertEqual(recursiveResult, iterativeResult)
        
    }
    
    func testChildlessRoot() {
        
        let root = TreeNode(1)
        
        let recursiveResult = recursiveSut.inorderTraversal(root)
        let iterativeResult = iterativeSut.inorderTraversal(root)
        
        XCTAssertEqual(recursiveResult, [1])
        XCTAssertEqual(recursiveResult, iterativeResult)
        
    }
    
    func testRootWithChildren() {
        
        let root = TreeNode(1)
        let left = TreeNode(2)
        let right = TreeNode(3)
        
        root.left = left
        root.right = right
        
        let recursiveResult = recursiveSut.inorderTraversal(root)
        let iterativeResult = iterativeSut.inorderTraversal(root)
        
        XCTAssertEqual(recursiveResult, [2,1,3])
        XCTAssertEqual(recursiveResult, iterativeResult)
    }
    
    func testRootWithMoreChildren() {
        
        let root = TreeNode(1)
        let left = TreeNode(2)
        let right = TreeNode(5)
        let leftLeft = TreeNode(3)
        let leftRight = TreeNode(4)
        left.left = leftLeft
        left.right = leftRight
        
        root.left = left
        root.right = right
        
        let recursiveResult = recursiveSut.inorderTraversal(root)
        let iterativeResult = iterativeSut.inorderTraversal(root)
        
        XCTAssertEqual(recursiveResult, [3,2,4,1,5])
        XCTAssertEqual(recursiveResult, iterativeResult)
    }
}
