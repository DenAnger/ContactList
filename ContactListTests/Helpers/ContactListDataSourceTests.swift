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
	var mockTableView: MockTableView!
	var contactListVC: ContactListViewController!
	var person: Person!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		dataSource = ContactListDataSource()
		dataSource.contactManager = ContactManager()
		
		mockTableView = MockTableView.mockTableView(withDataSource: dataSource)
		person = Person(name: "Foo", phone: "Bar")
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		contactListVC = storyboard.instantiateViewController(
			withIdentifier: "ContactListViewController"
		) as? ContactListViewController
		
		contactListVC.loadViewIfNeeded()
	}
	
	override func tearDownWithError() throws {
		dataSource = nil
		mockTableView = nil
		contactListVC = nil
		person = nil
		try super.tearDownWithError()
	}
	
	func testHasOneSection() {
		let numberOfSection = mockTableView.numberOfSections
		XCTAssertEqual(numberOfSection, 1)
	}
	
	func testNumberOfRowEqualsContactListCount() {
		dataSource.contactManager?.add(person: person)
		XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 1)
		
		dataSource.contactManager?.add(person: Person(name: "Baz",
													  phone: "Foo"))
		mockTableView.reloadData()
		XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
	}
	
	func testCellForRowAtIndexPathReturnsContactCell() {
		dataSource.contactManager?.add(person: person)
		mockTableView.reloadData()
		
		let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
		XCTAssertTrue(cell is ContactCell)
	}
	
	func testCellForRowDequeuesCellFromTableView() {
		dataSource.contactManager?.add(person: person)
		mockTableView.reloadData()
		
		_ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
		XCTAssert(mockTableView.cellIsDequeued)
	}
	
	func testCellForRowCallsConfigureCell() {
		dataSource.contactManager?.add(person: person)
		mockTableView.reloadData()
		
		let cell = mockTableView.cellForRow(
			at: IndexPath(row: 0, section: 0)
		) as! MockContactCell
		
		XCTAssertEqual(cell.person, person)
	}
}

extension ContactListDataSourceTests {
	class MockTableView: UITableView {
		var cellIsDequeued = false
		
		override func dequeueReusableCell(
			withIdentifier identifier: String,
			for indexPath: IndexPath
		) -> UITableViewCell {
			cellIsDequeued = true
			
			return super.dequeueReusableCell(
				withIdentifier: identifier,
				for: indexPath
			)
		}
		
		static func mockTableView(
			withDataSource dataSource: UITableViewDataSource
		) -> MockTableView {
			let mockTableView = MockTableView()
			mockTableView.dataSource = dataSource
			
			mockTableView.register(
				MockContactCell.self,
				forCellReuseIdentifier: "cell"
			)
			
			return mockTableView
		}
	}
	
	class MockContactCell: ContactCell {
		var person: Person?
		
		override func configure(with person: Person) {
			self.person = person
		}
	}
}
