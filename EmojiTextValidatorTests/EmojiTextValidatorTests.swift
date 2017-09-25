//
//  EmojiTextValidatorTests.swift
//  EmojiTextValidatorTests
//
//  Created by Manraaj Nijjar on 9/17/17.
//  Copyright © 2017 Manraaj Nijjar. All rights reserved.
//

import XCTest
@testable import EmojiTextValidator

class EmojiTextValidatorTests: XCTestCase {
    
    let testClass = EmojiTextValidator()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let _ = self.testClass.isEmoji(character: "👀")
        }
    }
    
    func testLetterCharacter() {
        self.measure {
            let _ = self.testClass.isEmoji(character: "a")
        }
        
    }
    
    func testStringEmoji() {
        // This is an example of a performance test case.
        self.measure{
            let _ = self.testClass.isEmoji(text: "👀")
        }
        
    }
    
    func testStringLetter() {
        // This is an example of a performance test case.
        self.measure {
            let _ = self.testClass.isEmoji(text: "a")
        }
        
    }
    
    func testComplexEmoji(){
        self.measure {
            let _ = self.testClass.isEmoji(text: "👨‍👨‍👦‍👦")
        }
    }
    
    
}
