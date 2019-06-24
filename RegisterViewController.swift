//
//  RegisterViewController.swift
//  EvenzO
//
//  Created by IKRAMUZZAMAN MUNTASIR on 18/6/19.
//  Copyright © 2019 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.confirmPasswordTextField.delegate = self 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func register(_ sender: UIButton) {
    
        if passwordTextField.text! != confirmPasswordTextField.text! {
            
            print("Password doesn't match")
        }else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error != nil {
                    
                    print(error!)
                }else {
                    
                    print("Registration Successful")
                    self.performSegue(withIdentifier: "registerToHome", sender: self)
                }
            }
        }
    }
    
    // Hide keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        confirmPasswordTextField.resignFirstResponder()
        
        return true
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
