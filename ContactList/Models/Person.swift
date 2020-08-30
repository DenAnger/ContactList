//
//  Person.swift
//  ContactList
//
//  Created by Denis Abramov on 30.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var phone: String
    var surname: String?
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
    
    init(name: String, surname: String, phone: String) {
        self.name = name
        self.surname = surname
        self.phone = phone
    }
}
