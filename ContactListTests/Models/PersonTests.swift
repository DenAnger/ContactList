//
//  PersonTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class PersonTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person)
    }
    
    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person)
    }
    
    func testWhenGivenNameAndPhoneSetsNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testWhenGivenSurnameSetsSurname() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertTrue(person.surname == "Bar")
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithFullNameAndWithDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let image = #imageLiteral(resourceName: "avatar")
        let imageData = image.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithFullNameAndImage() {
        let image = #imageLiteral(resourceName: "avatar")
        let imageData = image.pngData()
        let person = Person(name: "Foo",
                            surname: "Bar",
                            phone: "Baz",
                            imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
}
