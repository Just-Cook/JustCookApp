//
//  ModuleUITests.swift
//  ChallengePuttingAllTogetherUITests
//
//  Created by David Augusto on 25/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import XCTest
@testable import ChallengePuttingAllTogether

class ModuleUITests: XCTestCase {

    func test_module_actionables(){
        let app = XCUIApplication()
        
        app.launch()
        
        let tableViewQuery = XCUIApplication().tables
        let cardMaior = tableViewQuery/*@START_MENU_TOKEN@*/.otherElements["CardMaior"]/*[[".cells.otherElements[\"CardMaior\"]",".otherElements[\"CardMaior\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 1)
        XCTAssertTrue(cardMaior.isHittable)
        cardMaior.tap()
             
        
    }
    
    
}
