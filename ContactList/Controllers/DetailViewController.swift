//
//  DetailViewController.swift
//  ContactList
//
//  Created by Denis Abramov on 07.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var surnameLabel: UILabel!
	@IBOutlet var phoneLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	
	var person: Person!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		guard let imageData = person.imageData else {
			return
		}
		
		guard let image = UIImage(data: imageData) else {
			return
		}
		
		nameLabel.text = person.name
		surnameLabel.text = person.surname
		phoneLabel.text = person.phone
		imageView.image = image
	}
}
