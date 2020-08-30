//
//  ContactManager.swift
//  ContactList
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

class ContactManager {
    var contactsCount = 0
    
    func add(person: Person) {
        contactsCount += 1
    }
}
