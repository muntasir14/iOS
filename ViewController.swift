//
//  ViewController.swift
//  EvenzO
//
//  Created by IKRAMUZZAMAN MUNTASIR on 16/6/19.
//  Copyright © 2019 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        // Hide keyboard
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @IBAction func login(_ sender: UIButton) {
    
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                
                print(error!)
            }else{
                
                print("login successful!")
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            
        }
        
    }
    @IBAction func goToRegisterScreen(_ sender: UIButton) {
    
        
        performSegue(withIdentifier: "goToRegisterScreen", sender: self)
    }
    
    // Hide keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
    
}

