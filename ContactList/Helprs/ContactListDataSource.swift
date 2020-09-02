//
//  ContactListDataSource.swift
//  ContactList
//
//  Created by Denis Abramov on 01.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class ContactListDataSource: NSObject {
    
}

// MARK: - UITableViewDataSource
extension ContactListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
