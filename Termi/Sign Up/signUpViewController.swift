//
//  signUpViewController.swift
//  Termy
//
//  Created by Difeng Chen on 3/4/18.
//  Copyright © 2018 Difeng Chen. All rights reserved.
//

import UIKit
import Firebase
class signUpViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordComfrimTF: UITextField!
    
    @IBAction func signUpTapped(_ sender: Any) {
        //see if fields are empty
        if(usernameTF.text == "" || emailTF.text == "" || passwordTF.text == "" || passwordComfrimTF.text == ""){
                AlerController.showAllert(self, title: "Alert", Message: "Please fill out all fields.")
            print("1")
        }else if((passwordTF.text?.count)! < 8){
            AlerController.showAllert(self, title: "Alert", Message: "Password should have at least 8 characters.")
            print("2")
        }else if(passwordTF.text != passwordComfrimTF.text){
            AlerController.showAllert(self, title: "Alert", Message: "The two password fields are NOT match.")
            print("3")
        }else{
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
                guard error == nil else {
                    AlerController.showAllert(self, title: "Error", Message: error!.localizedDescription)
                    return
                }
                
                guard let user = user else { return }
                print(user.email ?? "MISSING EMAIL")
                print(user.uid)
                
                //edit username
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = self.usernameTF.text
                changeRequest.commitChanges(completion: { (error) in
                    guard error == nil else{
                        AlerController.showAllert(self, title: "Error", Message: error!.localizedDescription)
                        return
                    }
                    user.sendEmailVerification(completion: nil)
                    
                    self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                })
            }
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
