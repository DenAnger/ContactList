//
//  ContactListDataSourceTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 02.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactListDataSourceTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {

        try super.tearDownWithError()
    }
    
    func testHasOneSection() {
        let dataSource = ContactListDataSource()
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowEqualsContactListCount() {
        let dataSource = ContactListDataSource()
        dataSource.contactManager = ContactManager()
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        dataSource.contactManager?.add(person: Person(name: "Foo",
                                                      phone: "Bar"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Baz",
                                                      phone: "Foo"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
}
