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
    
    var listOfItem = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.placeholder = "username"
        p.placeholder = "password"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneAction(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "The username already exist!", preferredStyle: .alert  );
        let alert2 = UIAlertController(title: "Alert", message: "Password must contains at least 6 words", preferredStyle: .alert  );
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction)
        alert2.addAction(cancelAction)
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let readArray = arrayObject as? NSArray {
            for i in readArray {
                if let index = (i as! String).index(of: " ") {
                    let substring = (i as! String)[..<index]
                    let username = String(substring)
                    if username.elementsEqual(user.text!) {
                        self.present(alert, animated: true, completion: nil);
                        return ;
                    }
                }
            }
        }
        if(p.text!.count < 6) {
            self.present(alert2, animated: true, completion: nil);
        }
        else{
            UserDefaults.standard.set(user.text, forKey: "registeredUser")
            UserDefaults.standard.set(p.text, forKey: "registeredPassword")
        }
    }
    
     func cancelActionHandler(action: UIAlertAction) {}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
