//
//  ContactListDataSource.swift
//  ContactList
//
//  Created by Denis Abramov on 01.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class ContactListDataSource: NSObject {
	var contactManager: ContactManager?
}

// MARK: - UITableViewDataSource
extension ContactListDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return contactManager?.contactsCount ?? 0
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "cell",
			for: indexPath
		) as! ContactCell
		
		if let person = contactManager?.person(at: indexPath.row) {
			cell.configure(with: person)
		}
		return cell
	}
}
