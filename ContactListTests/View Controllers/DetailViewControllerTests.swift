//
//  DetailViewControllerTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 06.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class DetailViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testHasNameLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as! DetailViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.nameLabel)
    }
}
