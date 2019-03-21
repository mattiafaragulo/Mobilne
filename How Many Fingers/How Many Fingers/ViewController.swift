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
    var usrTextField = UITextField();
    
    @IBAction func showAlert(_ sender: UIButton) {
            let alert = UIAlertController(title: "My first alert", message: "My message", preferredStyle: .alert  );
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
            alert.addAction(cancelAction);
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler);
            
            alert.addAction(okAction);
            
            alert.addTextField(configurationHandler: alertTextFieldConfiguration);
            
            self.present(alert, animated: true, completion: nil);
            
    }
        
    func cancelActionHandler(action: UIAlertAction) {
            print("Pressed Cancel");
    }
        
    func okActionHandler(action: UIAlertAction) {
        let randomNumber = Int.random(in: 0...10);
        let userNumber = Int(usrTextField.text!)!;
        if userNumber == randomNumber {
            print()
            output.text = "Yes, that's correct!"
            
        }
            
        else {
            print("No you're wrong !")
            output.text = "No, you're wrong!"
        }    }
        
    func alertTextFieldConfiguration(textField: UITextField) {
            textField.placeholder = "Insert a number";
            textField.textColor = UIColor.orange;
            usrTextField = textField;
    }
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func guessListener(_ sender: UIButton) {
        let randomNumber = Int.random(in: 0...10)
        let userNumber = Int(textField.text!)!;
        
        if userNumber == randomNumber {
            print()
            output.text = "Yes, that's correct!"
        
        }
        
        else {
            print("No you're wrong !")
            output.text = "No, you're wrong!"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

