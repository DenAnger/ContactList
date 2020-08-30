//
//  ContactManagerTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        contactManager = ContactManager()
    }

    override func tearDownWithError() throws {
        contactManager = nil
        try super.tearDownWithError()
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        let person = Person(name: "Foo", phone: "Bar")
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}
