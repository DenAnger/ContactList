//
//  ContactCellTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 04.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactCellTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testCellHasNameLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: "ContactListViewController"
            ) as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        let cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell",
            for: IndexPath(row: 0, section: 0)
            ) as! ContactCell
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasNameLabelInContentView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: "ContactListViewController"
            ) as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        let cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell",
            for: IndexPath(row: 0, section: 0)
            ) as! ContactCell
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView))
    }
}

extension ContactCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
