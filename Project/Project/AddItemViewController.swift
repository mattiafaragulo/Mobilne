//
//  AddItemViewController.swift
//  Project
//
//  Created by Mattia on 24/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController  {

    @IBOutlet weak var textField: UITextField!
    
    var listOfUser = Array<String>()
    var newListOfUser = Array<String>()
    var count = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.placeholder = "write something..."
        let title = UserDefaults.standard.object(forKey: "titleLabel")
        if let readTitle = title as? String {
            let list = UserDefaults.standard.object(forKey: readTitle)
            if let readList = list as? NSArray {
                listOfUser = readList as! [String]
            }
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addAction(_ sender: UIButton) {
        UserDefaults.standard.set(textField.text, forKey: "items");
        listOfUser.append(textField.text!)
        let title = UserDefaults.standard.object(forKey: "titleLabel")
        if let readTitle = title as? String {
            UserDefaults.standard.set(listOfUser, forKey: readTitle)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
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
