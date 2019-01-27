//
//  ViewController.swift
//  aggieScan1.1
//
//  Created by Robert Elizondo on 1/27/19.
//  Copyright © 2019 Robert Elizondo. All rights reserved.
//

import UIKit

var uin = ""

class ViewController: UIViewController {
    
    
    @IBOutlet weak var uinField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uinField.delegate = self
        passwordField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func generateButton(_ sender: Any) {
            
        if (uinField.text != "")
        {
            uin = uinField.text!
            
            var ping = "http://www.aggiescan.com/qr?uin="
            
            ping += uin

           UIApplication.shared.open(URL(string: ping)! as URL, options: [:] , completionHandler: nil)
            
            
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        uinField.resignFirstResponder()
    }
    
    
}
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
