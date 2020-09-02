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
}
