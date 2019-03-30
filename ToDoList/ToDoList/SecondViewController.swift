//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Mattia on 29/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
   
    @IBAction func senderButton(_ sender: UIButton) {
        UserDefaults.standard.set(textField.text, forKey: "items");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.placeholder = "e.g. do math homework"
    }


}

