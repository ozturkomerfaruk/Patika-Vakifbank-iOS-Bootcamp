//
//  TestTests.swift
//  TestTests
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import XCTest
@testable import Test

final class TestTests: XCTestCase {

    func testAddStuff() {
        let math = MathStuff()
        
        let result = math.addNumbers(x: 5, y: 5)
        XCTAssertEqual(result, 10)
        
        
    }

}
