//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Denis Abramov on 25.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
}
