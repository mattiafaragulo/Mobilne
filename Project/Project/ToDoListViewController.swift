//
//  ToDoListViewController.swift
//  Project
//
//  Created by Mattia on 24/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController,
                              UITableViewDataSource,
                              UITableViewDelegate{
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var removeItemButton: UIButton!
    
    var items = Array<String>()
    var newListOfUser = Array<String>()
    var removeTextField = UITextField()
   
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell");
        UserDefaults.standard.set(items, forKey: "items");
        cell.textLabel?.text = items[indexPath.row]
        return cell;
    }
    
    @IBAction func removeAct(_ sender: UIButton) {
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
                self.viewDidLoad()
                self.viewDidAppear(true)
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

    override func viewDidAppear(_ animated: Bool) {
        let elementOfItems = UserDefaults.standard.object(forKey: "items")
        if let readItem = elementOfItems as? String{
            items.append(readItem)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let title = UserDefaults.standard.object(forKey: "titleLabel")
        if let readTitle = title as? String {
            label.text = "User: " + readTitle
            let array = UserDefaults.standard.object(forKey: readTitle)
            if let readArray = array as? NSArray {
                items = readArray as! [String]
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
