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
        let alert1 = UIAlertController(title: "Alert", message: "Yes that's correct!", preferredStyle: .alert  );
        let alert2 = UIAlertController(title: "Alert", message: "No you're wrong!", preferredStyle: .alert  );
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelActionHandler);
        alert1.addAction(cancelAction);
        alert2.addAction(cancelAction);
        
        if input == fingers {
            self.present(alert1, animated: true, completion: nil);
        }
        else {
            self.present(alert2, animated: true, completion: nil);
        }
    }
    
    func alertTextFieldConfiguration(textField: UITextField) {
        textField.placeholder = "Insert text";
        textField.textColor = UIColor.orange;
        usrTextField = textField;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

