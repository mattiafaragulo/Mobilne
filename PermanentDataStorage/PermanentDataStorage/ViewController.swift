//
//  ViewController.swift
//  PermanentDataStorage
//
//  Created by Systemy mobilne on 28/03/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UserDefaults.standard.set("Mattia", forKey: "name");
        let name = UserDefaults.standard.object(forKey: "name");
        if let nameString = name as? String {
            print("The value stored in UserDefaults under the _name_ key is: \(nameString)");
        }
        let familyMembersArray = ["Franco", "Teresa", "Daniele"];
        UserDefaults.standard.set(familyMembersArray, forKey: "familyMembers");
        let familyMembersObject = UserDefaults.standard.object(forKey: "familyMembers");
        if let readFamilyMembersArray = familyMembersObject as? NSArray {
            print(" \(readFamilyMembersArray)");
        }
        
    }


}

