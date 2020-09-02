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
    
    var dataSource: ContactListDataSource!
    var tableView: UITableView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSource = ContactListDataSource()
        dataSource.contactManager = ContactManager()
        tableView = UITableView()
        tableView.dataSource = dataSource
    }

    override func tearDownWithError() throws {
        dataSource = nil
        tableView = nil
        try super.tearDownWithError()
    }
    
    func testHasOneSection() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowEqualsContactListCount() {
        dataSource.contactManager?.add(person: Person(name: "Foo",
                                                      phone: "Bar"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Baz",
                                                      phone: "Foo"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsContactCell() {
        dataSource.contactManager?.add(person: Person(name: "Foo",
                                                      phone: "Bar"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ContactCell)
    }
}
