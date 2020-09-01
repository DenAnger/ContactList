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

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedTableViewIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController"
        ) as! ContactListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedContactListDataSourceIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController"
        ) as! ContactListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.dataSource)
    }
}
