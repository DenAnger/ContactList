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
    
    var sut: NewContactViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as? NewContactViewController
        sut.loadViewIfNeeded()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHasNameTextField() {
        XCTAssertTrue(sut.nameTextField.isDescendant(of: sut.view))
    }
    
    func testHasSurnameTextField() {
        XCTAssertTrue(sut.surnameTextField.isDescendant(of: sut.view))
    }
    
    func testHasPhoneTextField() {
        XCTAssertTrue(sut.phoneTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testSaveNewContact() {
        sut.nameTextField.text = "Foo"
        sut.surnameTextField.text = "Bar"
        sut.phoneTextField.text = "Baz"
        
        sut.contactManager = ContactManager()
        sut.saveButtonPressed()
        
        let contact = sut.contactManager.person(at: 0)
        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        let person = Person(name: "Foo",
                            surname: "Bar",
                            phone: "Baz",
                            imageData: imageData)
        XCTAssertEqual(contact, person)
    }
}
