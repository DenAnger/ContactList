//
//  ContactListViewControllerTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 01.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactListViewControllerTests: XCTestCase {
    
    var sut: ContactListViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController"
            ) as? ContactListViewController
        sut.loadViewIfNeeded()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedContactListDataSourceIsNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
}
