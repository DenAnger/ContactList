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
    
    var cell: ContactCell!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: "ContactListViewController"
            ) as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell",
            for: IndexPath(row: 0, section: 0)
            ) as? ContactCell
    }
    
    override func tearDownWithError() throws {
        cell = nil
        try super.tearDownWithError()
    }
    
    func testCellHasNameLabel() {
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasNameLabelInContentView() {
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsName() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configure(with: person)
        XCTAssertEqual(cell.nameLabel.text, person.name)
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
