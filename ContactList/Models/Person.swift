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
    var imageData: Data?
    var date: Date?
    
    init(name: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        self.imageData = imageData
        date = Date()
    }
    
    init(name: String, surname: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageData = imageData
        date = Date()
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.phone == rhs.phone
    }
}
