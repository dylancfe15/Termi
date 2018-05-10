//
//  signInViewController.swift
//  Termy
//
//  Created by Difeng Chen on 3/4/18.
//  Copyright © 2018 Difeng Chen. All rights reserved.
//

import UIKit
import Firebase

class signInViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func signInTapped(_ sender: Any) {
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else{
            AlerController.showAllert(self, title: "Missing Info", Message: "Please fill out all required fields.")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlerController.showAllert(self, title: "Error", Message: error!.localizedDescription)
                return
            }
            guard let user = user else{ return }
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName!)
            print(user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
