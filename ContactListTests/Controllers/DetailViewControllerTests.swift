//
//  DetailViewControllerTests.swift
//  ContactListTests
//
//  Created by Denis Abramov on 06.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import ContactList

class DetailViewControllerTests: XCTestCase {
	
	var sut: DetailViewController!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		sut = storyboard.instantiateViewController(
			withIdentifier: "DetailViewController"
		) as? DetailViewController
		
		sut.loadViewIfNeeded()
	}
	
	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}
	
	func testHasNameLabel() {
		XCTAssertNotNil(sut.nameLabel)
	}
	
	func testHasNameLabelInView() {
		XCTAssertTrue(sut.nameLabel.isDescendant(of: sut.view))
	}
	
	func testHasSurnameLabel() {
		XCTAssertNotNil(sut.surnameLabel)
	}
	
	func testHasSurnameLabelInView() {
		XCTAssertTrue(sut.surnameLabel.isDescendant(of: sut.view))
	}
	
	func testHasPhoneLabel() {
		XCTAssertNotNil(sut.phoneLabel)
	}
	
	func testHasPhoneLabelInView() {
		XCTAssertTrue(sut.phoneLabel.isDescendant(of: sut.view))
	}
	
	func testHasImageView() {
		XCTAssertNotNil(sut.imageView)
	}
	
	func testHasImageViewInView() {
		XCTAssertTrue(sut.imageView.isDescendant(of: sut.view))
	}
	
	func testSetValueToNameLabel() {
		setupContactAndAppearanceTransition()
		XCTAssertEqual(sut.nameLabel.text, "Foo")
	}
	
	func testSetValueToSurnameLabel() {
		setupContactAndAppearanceTransition()
		XCTAssertEqual(sut.surnameLabel.text, "Bar")
	}
	
	func testSetValueToPhoneLabel() {
		setupContactAndAppearanceTransition()
		XCTAssertEqual(sut.phoneLabel.text, "Baz")
	}
	
	func testSetValueToImageView() {
		setupContactAndAppearanceTransition()
		let imageData = #imageLiteral(resourceName: "avatar").pngData()
		XCTAssert(sut.person.imageData == imageData)
	}
	
	func testImageViewNotNil() {
		setupContactAndAppearanceTransition()
		XCTAssertNotNil(sut.imageView.image)
	}
	
	func setupContactAndAppearanceTransition() {
		let image = #imageLiteral(resourceName: "avatar")
		let imageData = image.pngData()
		let person = Person(
			name: "Foo",
			surname: "Bar",
			phone: "Baz",
			imageData: imageData
		)
		sut.person = person
		sut.beginAppearanceTransition(true, animated: true)
		sut.endAppearanceTransition()
	}
}
