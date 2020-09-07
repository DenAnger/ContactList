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
    
    var sut: DetailViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHasNameLabel() {
        XCTAssertNotNil(sut.nameLabel)
    }
    
    func testHasNameLabelInView() {
        XCTAssertTrue(sut.nameLabel.isDescendant(of: sut.view))
    }
    
    func testHasSurnameLabel() {
        XCTAssertNotNil(sut.surnameLabel)
    }
    
    func testHasSurnameLabelInView() {
        XCTAssertTrue(sut.surnameLabel.isDescendant(of: sut.view))
    }
    
    func testHasPhoneLabel() {
        XCTAssertNotNil(sut.phoneLabel)
    }
    
    func testHasPhoneLabelInView() {
        XCTAssertTrue(sut.phoneLabel.isDescendant(of: sut.view))
    }
    
}
