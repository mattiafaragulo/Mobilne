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
        password.isSecureTextEntry = true
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let readArray = arrayObject as? NSArray {
            registeredUsers = readArray as! [String]
        }
    }
    
    @IBAction func logAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Login is wrong!", preferredStyle: .alert  );
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction)
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        let user = username.text!+" "+password.text!
        if let readArray = arrayObject as? NSArray {
            if(!readArray.contains(user)) {
                self.present(alert, animated: true, completion: nil);
            }
        }
        UserDefaults.standard.set(username.text, forKey: "titleLabel")
    }
    
    func cancelActionHandler(action: UIAlertAction) {}
    
    @IBAction func exitFromSecondVC(_ segue: UIStoryboardSegue) {
        let RegisterVC = segue.source as! RegisterViewController
        registeredUsers.append(RegisterVC.user.text!+" "+RegisterVC.p.text!)
        UserDefaults.standard.set(registeredUsers, forKey: "array")
    }
    
}

