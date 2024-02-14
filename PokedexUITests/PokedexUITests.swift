//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Oguz Tandogan on 9.02.2024.
//

import XCTest
@testable import Pokedex

class PokemonListViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testPokemonListDisplayed() throws {
        XCTAssert(app.navigationBars["Pokemon"].exists)
        XCTAssert(app.tables.firstMatch.exists)
        
        let firstCell = app.tables.cells.firstMatch
        XCTAssert(firstCell.exists)
        
        firstCell.tap()
        
        XCTAssert(app.navigationBars.count != 0)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        XCTAssert(app.buttons["Switch"].exists)
        
        app.buttons["Switch"].tap()
    }
}
