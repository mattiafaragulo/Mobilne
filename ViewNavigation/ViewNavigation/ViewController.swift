//
//  ViewController.swift
//  ViewNavigation
//
//  Created by Systemy mobilne on 04/04/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mySecondView = segue.destination as! MySecondViewController
        mySecondView.dataFromFirstControler = textField.text!
    }
    
    @IBAction func exitFromSecondVC(segue: UIStoryboardSegue) {
        let MySecondVC = segue.destination as! MySecondViewController
        textField.text = MySecondVC.textField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.placeholder = "Data to pass between views"
    }
    

}

