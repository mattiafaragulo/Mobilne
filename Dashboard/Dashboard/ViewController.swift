//
//  ViewController.swift
//  Dashboard
//
//  Created by Systemy mobilne on 21/03/2019.
//  Copyright © 2019 Systemy mobilne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        print("Value of alert: \(usrTextField.text!)");
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

