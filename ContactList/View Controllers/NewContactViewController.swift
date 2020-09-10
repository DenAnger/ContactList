//
//  NewContactViewController.swift
//  ContactList
//
//  Created by Denis Abramov on 08.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var contactManager: ContactManager!
    
    @IBAction func saveButtonPressed() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let phone = phoneTextField.text
        
        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        let person = Person(name: name ?? "",
                            surname: surname ?? "",
                            phone: phone ?? "",
                            imageData: imageData)
        contactManager.add(person: person)
        dismiss(animated: true)
    }
}
