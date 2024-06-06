//
//  ContactManager.swift
//  ContactList
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

class ContactManager {
	private var persons: [Person] = []
	
	var contactsCount: Int {
		return persons.count
	}
	
	func add(person: Person) {
		if !persons.contains(person) {
			persons.append(person)
		}
	}
	
	func person(at index: Int) -> Person {
		return persons[index]
	}
}
