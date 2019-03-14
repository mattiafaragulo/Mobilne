//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Systemy mobilne on 07.03.2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func guessListener(_ sender: UIButton) {
        let randomNumber = arc4random_uniform(6)
        let userNumber = Int(textField.text!)!
        if userNumber == randomNumber {
            textField.text = "Win !"
        }
        else {
            textField.text = "Lose!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

