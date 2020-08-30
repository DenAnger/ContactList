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
    
    var image: UIImage?
    var imageData: Data?

    override func setUpWithError() throws {
        try super.setUpWithError()
        image = #imageLiteral(resourceName: "avatar")
        guard let image = image else { return }
        imageData = image.pngData()
    }

    override func tearDownWithError() throws {
        image = nil
        imageData = nil
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
    
    func testInitPersonWithFullNameAndDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithFullNameAndImage() {
        let person = Person(name: "Foo",
                            surname: "Bar",
                            phone: "Baz",
                            imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
}
