//
//  ViewController.swift
//  Project
//
//  Created by Systemy mobilne on 11/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var registeredUsers = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        username.placeholder = "username"
        password.placeholder = "password"
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let readArray = arrayObject as? NSArray {
            registeredUsers = readArray as! [String]
        }
    }
    
    @IBAction func exitFromSecondVC(_ segue: UIStoryboardSegue) {
        let RegisterVC = segue.source as! RegisterViewController
        registeredUsers.append(RegisterVC.user.text!+" "+RegisterVC.p.text!)
        UserDefaults.standard.set(registeredUsers, forKey: "array")
        
    }


}

