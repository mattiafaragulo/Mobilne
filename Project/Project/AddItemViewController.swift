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
    var removeTextField = UITextField()
    var newListOfUser = Array<String>()
   
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
    
    @IBAction func removeAction(_ sender: Any) {
        let alert = UIAlertController(title: "Remove an item", message: "Insert the position of item which you want to remove from list", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction);
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler);
        
        alert.addAction(okAction);
        
        alert.addTextField(configurationHandler: alertTextFieldConfiguration);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    func okActionHandler(action: UIAlertAction) {
        let alert2 = UIAlertController(title: "Alert", message: "I'm sorry, it's impossible to remove!", preferredStyle: .alert  );
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        let user = UserDefaults.standard.object(forKey: "titleLabel")
        if let readUser = user as? String {
            let listOfUser = UserDefaults.standard.object(forKey: readUser)
            if let readListOfUser = listOfUser as? NSArray {
                newListOfUser = readListOfUser as! [String]
            }
            if Int(removeTextField.text!)! > newListOfUser.count {
                self.present(alert2, animated: true, completion: nil);
            }
            else{
                newListOfUser.remove(at: (Int(removeTextField.text!)!))
                UserDefaults.standard.set(newListOfUser, forKey: readUser)
                let alert1 = UIAlertController(title: "Alert", message: "The item " + removeTextField.text! + " is removed", preferredStyle: .alert  );
                alert1.addAction(cancelAction);
                self.present(alert1, animated: true, completion: nil);
            }
            
        }
        alert2.addAction(cancelAction);
    }
    
    func cancelActionHandler(action: UIAlertAction) {}
    
    func alertTextFieldConfiguration(textField: UITextField) {
        removeTextField.placeholder = "insert the position";
        removeTextField = textField
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        removeTextField.resignFirstResponder()
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
