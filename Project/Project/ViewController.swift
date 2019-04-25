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
    
    var removeUsrTextField = UITextField ()
    var removePassTextField = UITextField ()
    
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
        let alert = UIAlertController(title: "Alert", message: "Login is incorrect!", preferredStyle: .alert  );
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
        if(RegisterVC.p.text!.count >= 6) {
            registeredUsers.append(RegisterVC.user.text!+" "+RegisterVC.p.text!)
            UserDefaults.standard.set(registeredUsers, forKey: "array")
        }
    }
    
    @IBAction func removeAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Remove your account", message: "Insert username and password", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction);
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler);
        
        alert.addAction(okAction);
        
        alert.addTextField(configurationHandler: alertTextFieldConfiguration1);
        alert.addTextField(configurationHandler: alertTextFieldConfiguration2)
        
        self.present(alert, animated: true, completion: nil);
    }
    
    func okActionHandler(action: UIAlertAction) {
        let alert1 = UIAlertController(title: "Alert", message: "Your account is removed!", preferredStyle: .alert  );
        let alert2 = UIAlertController(title: "Alert", message: "I'm sorry, it's impossible to remove: user or password are incorrect!", preferredStyle: .alert  );
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert1.addAction(cancelAction);
        alert2.addAction(cancelAction);
        let verify = removeUsrTextField.text!+" "+removePassTextField.text!
        let index = registeredUsers.index(of: verify)
        if(index == nil) {
            self.present(alert2, animated: true, completion: nil);
        }
        else {
            registeredUsers.remove(at: index as! Int)
            UserDefaults.standard.set(registeredUsers, forKey: "array")
            self.present(alert1, animated: true, completion: nil);
        }

    }
    
    func alertTextFieldConfiguration1(textField: UITextField) {
        removeUsrTextField.placeholder = "username";
        removeUsrTextField = textField
    }
    
    func alertTextFieldConfiguration2(textField: UITextField) {
        removePassTextField.placeholder = "password";
        removePassTextField = textField
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
}

