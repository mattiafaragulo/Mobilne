//
//  ViewController.swift
//  How Many Fingers?
//
//  Created by Mattia on 14/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func ButtonEvent(_ sender: Any) {
        let input = Int(textfield.text!)
        let fingers = Int.random(in:0...10)
        if input == fingers {
            print("Yes, that's correct!")
            output.text = "Yes, that's correct!"
        }
        else {
            print("No, you're wrong!")
            output.text = "No, you're wrong!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

