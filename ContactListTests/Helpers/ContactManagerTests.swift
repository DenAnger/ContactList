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

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testInitContactManagerWithEmptyList() {
        let contactManeger = ContactManager()
        XCTAssertEqual(contactManeger.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        let contactManager = ContactManager()
        let person = Person(name: "Foo", phone: "Bar")
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}
