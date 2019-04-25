//
//  AddItemViewController.swift
//  Project
//
//  Created by Mattia on 24/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var listOfUser = Array<String>()
   
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
    
    @IBAction func ClearAction(_ sender: Any) {
        listOfUser.removeAll()
        let title = UserDefaults.standard.object(forKey: "titleLabel")
        if let readTitle = title as? String {
            UserDefaults.standard.set(listOfUser, forKey: readTitle)
            let alert = UIAlertController(title: "the list of " + readTitle + " is empty now", message: "", preferredStyle: .alert  );
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
            alert.addAction(cancelAction);
            self.present(alert, animated: true, completion: nil);
        }
    }
    
    func cancelActionHandler(action: UIAlertAction) {}
    
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
