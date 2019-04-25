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
    
    var items = Array<String>()
   
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

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
