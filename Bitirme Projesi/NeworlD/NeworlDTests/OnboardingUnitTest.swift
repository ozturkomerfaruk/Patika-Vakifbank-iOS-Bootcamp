//
//  OnboardingUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD

final class OnboardingUnitTest: XCTestCase {
    var sut: OnboardingViewModel!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = OnboardingViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetCountSlide() {
        XCTAssertEqual(sut.countSlide(), 0)
        
        sut.appendSlide(model: OnboardingModel(title: "title", description: "description", lottieViewStr: "lottieViewStr"))
        
        XCTAssertEqual(sut.countSlide(), 1)
    }
    
    func testGetSlideModel() {
        XCTAssertEqual(sut.countSlide(), 0)
        
        sut.appendSlide(model: OnboardingModel(title: "title", description: "description", lottieViewStr: "lottieViewStr"))
        
        XCTAssertEqual(sut.getSlideModel(at: 0).title, "title")
        XCTAssertEqual(sut.getSlideModel(at: 0).description, "description")
        XCTAssertEqual(sut.getSlideModel(at: 0).lottieViewStr, "lottieViewStr")
    }
}
