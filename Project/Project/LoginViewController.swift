//
//  LoginViewController.swift
//  Project
//
//  Created by Systemy mobilne on 11/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class LoginViewController: UITabBarController
                           {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let readArray = arrayObject as? NSArray {
            print(readArray)
        }
        // Do any additional setup after loading the view.
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
