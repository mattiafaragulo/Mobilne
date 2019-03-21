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
    
    var usrTextField = UITextField();
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Alert", message: "Insert a number", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction);
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler);
        
        alert.addAction(okAction);
        
        alert.addTextField(configurationHandler: alertTextFieldConfiguration);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    func cancelActionHandler(action: UIAlertAction) {}
    
    func okActionHandler(action: UIAlertAction) {
        let input = Int(usrTextField.text!)
        let fingers = Int.random(in:0...10)
        let alert = UIAlertController(title: "Alert", message: "Checking...", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert.addAction(cancelAction);
        
        if input == fingers {
            alert.addTextField(configurationHandler: alertCorrect);
            self.present(alert, animated: true, completion: nil);
        }
        else {
            alert.addTextField(configurationHandler: alertWrong);
            self.present(alert, animated: true, completion: nil);
        }
    }
    
    func alertTextFieldConfiguration(textField: UITextField) {
        textField.placeholder = "Insert text";
        textField.textColor = UIColor.orange;
        usrTextField = textField;
    }
    
    func alertCorrect(textField: UITextField) {
        textField.text = "Yes, that's correct!"
        textField.isUserInteractionEnabled = false;
    }
    
    func alertWrong(textField: UITextField) {
        textField.text = "No, you're wrong!";
        textField.isUserInteractionEnabled = false;
    }
    
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

