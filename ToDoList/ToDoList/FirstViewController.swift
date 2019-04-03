//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Mattia on 29/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,
                           UITableViewDataSource,
UITableViewDelegate{
    
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
        if let readItem = elementOfItems as? String {
            items.append(readItem)
        }
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let itemObject = UserDefaults.standard.object(forKey: "items")
        if let readItem = itemObject as? NSArray {
            items = readItem as! [String]
        }
    }


}

