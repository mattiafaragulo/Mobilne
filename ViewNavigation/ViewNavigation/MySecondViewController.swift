//
//  MySecondViewController.swift
//  ViewNavigation
//
//  Created by Systemy mobilne on 04/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class MySecondViewController: UIViewController {
    
    var dataFromFirstControler = String()

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = dataFromFirstControler
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
