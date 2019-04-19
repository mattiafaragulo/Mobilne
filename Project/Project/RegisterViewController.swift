//
//  RegisterViewController.swift
//  Project
//
//  Created by Systemy mobilne on 11/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var p: UITextField!
    
    var registeredUsers = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.placeholder = "username"
        p.placeholder = "password"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneAction(_ sender: Any) {
        UserDefaults.standard.set(user.text, forKey: "registeredUser")
        UserDefaults.standard.set(p.text, forKey: "registeredPassword")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
