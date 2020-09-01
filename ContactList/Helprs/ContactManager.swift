//
//  ContactManager.swift
//  ContactList
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

class ContactManager {
    var contactsCount: Int { return persons.count }
    
    private var persons: [Person] = []
    
    func add(person: Person) {
        persons.append(person)
    }
    
    func person(at index: Int) -> Person {
        return persons[index]
    }
}
