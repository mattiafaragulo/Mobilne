//
//  ViewController.swift
//  TableView
//
//  Created by Systemy mobilne on 28/03/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDataSource,
UITableViewDelegate {
    
    let familyMembersArray = ["Franco", "Teresa", "Daniele","Mattia"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell");
        cell.textLabel?.text = familyMembersArray[indexPath.row]
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

