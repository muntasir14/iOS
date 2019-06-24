//
//  HomeViewController.swift
//  EvenzO
//
//  Created by IKRAMUZZAMAN MUNTASIR on 18/6/19.
//  Copyright © 2019 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var foodTypeTextField: UITextField!
    @IBOutlet weak var decorationTextField: UITextField!
    @IBOutlet weak var shortDescTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shortDescTextView.delegate = self 
        // Do any additional setup after loading the view.
    }
    
    /*@IBAction func insertPressed(_ sender: UIButton) {
        
        let eventDB = Database.database().reference().child("Events")
        let eventDictionary = ["User": Auth.auth().currentUser?.email,
                               "EventBody": insertTextField.text!]
        
        eventDB.childByAutoId().setValue(eventDictionary) {
            (error, reference) in
            
            if error != nil {
                
                print(error!)
            }else {
                
                print("Message saved successfully!")
            }
            
        }
        
    }*/
    
    @IBAction func postButton(_ sender: UIButton) {
    
        let eventDB = Database.database().reference().child("Events")
        let eventDictionary = ["User": Auth.auth().currentUser?.email,
                               "Category": categoryTextField.text!,
                               "Food Type": foodTypeTextField.text!,
                               "Decoration Type": decorationTextField.text!,
                               "Short Desc": shortDescTextView.text!]
        
        eventDB.childByAutoId().setValue(eventDictionary) {
            (error, reference) in
            
            if error != nil {
                
                print(error!)
            }else {
                
                print("Message saved successfully!")
            }
            
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Hide keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        shortDescTextView.resignFirstResponder()
        
        
        return true
    }

    @IBAction func logoutPressed(_ sender: UIButton) {
    
        do{
            
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        }catch{
            
            print("Error, there was a problem signing out")
        }
    }
}
