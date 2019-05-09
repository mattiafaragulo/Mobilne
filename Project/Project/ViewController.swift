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
    var registerUsrTextField = UITextField ()
    var registerPassTextField = UITextField ()
    
    var registeredUsers = Array<String>()
    var removeListOfUser = Array<String>()
    

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
        if let readArray = arrayObject as? [String] {
            if((!readArray.contains(user)) || (readArray.isEmpty)) {
                self.present(alert, animated: true, completion: nil);
            }
        }
        UserDefaults.standard.set(username.text, forKey: "titleLabel")
    }
    
    func cancelActionHandler(action: UIAlertAction) {}
    
    @IBAction func logOutAction(_ segue: UIStoryboardSegue) {
        username.text! = ""
        password.text! = ""
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
            let listOfUser = UserDefaults.standard.object(forKey: removeUsrTextField.text!)
            if let readListOfUser = listOfUser as? NSArray {
                removeListOfUser = readListOfUser as! [String]
            }
            removeListOfUser.removeAll()
            UserDefaults.standard.set(removeListOfUser, forKey: removeUsrTextField.text!)
            self.present(alert1, animated: true, completion: nil);
        }
        
    }
    
    func alertTextFieldConfiguration1(textField: UITextField) {
        removeUsrTextField = textField
    }
    
    func alertTextFieldConfiguration2(textField: UITextField) {
        removePassTextField = textField
    }
    
    func alertTextFieldConfiguration3(textField: UITextField) {
        registerUsrTextField = textField
    }
    
    func alertTextFieldConfiguration4(textField: UITextField) {
        registerPassTextField = textField
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Register your account", message: "Insert username and password", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction);
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler2);
        
        alert.addAction(okAction)
        
        alert.addTextField(configurationHandler: alertTextFieldConfiguration3);
        alert.addTextField(configurationHandler: alertTextFieldConfiguration4)
        
        self.present(alert, animated: true, completion: nil);
    
    }
    
    func okActionHandler2(action: UIAlertAction) {
        let alert1 = UIAlertController(title: "Alert", message: "The username has already exist!", preferredStyle: .alert  );
        let alert2 = UIAlertController(title: "Alert", message: "Password must contains at least 6 characters", preferredStyle: .alert );
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert1.addAction(cancelAction)
        alert2.addAction(cancelAction)
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let readArray = arrayObject as? NSArray {
            for i in readArray {
                if let index = (i as! String).index(of: " ") {
                    let substring = (i as! String)[..<index]
                    let username = String(substring)
                    if username.elementsEqual(registerUsrTextField.text!) {
                        self.present(alert1, animated: true, completion: nil);
                        return ;
                    }
                }
            }
        }
        if(registerPassTextField.text!.count >= 6) {
            registeredUsers.append(registerUsrTextField.text!+" "+registerPassTextField.text!)
            UserDefaults.standard.set(registeredUsers, forKey: "array")
        }
        else{
            self.present(alert2, animated: true, completion: nil);
            return ;
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
        removeUsrTextField.resignFirstResponder()
        removePassTextField.resignFirstResponder()
        registerUsrTextField.resignFirstResponder()
        registerPassTextField.resignFirstResponder()
    }
    
}

