//
//  HtmlLabelTests.swift
//  HtmlLabelTests
//
//  Created by Ana Finotti on 19/12/20.
//

import XCTest
@testable import HtmlLabel

class HtmlLabelTests: XCTestCase {

    var htmlLabel: HtmlLabel?
    
    override func setUpWithError() throws {
        
        self.htmlLabel = HtmlLabel()
        self.htmlLabel?.text = "<b>This is a test</b>"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        XCTAssertNotNil(self.htmlLabel?.text)
    }
}
