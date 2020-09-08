//
//  NewContactViewControllerTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 08.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class NewContactViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testHasNameTextField() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as! NewContactViewController
        sut.loadViewIfNeeded()
        XCTAssertTrue(sut.nameTextField.isDescendant(of: sut.view))
    }
}
