//
//  SignInSignUpViewController.swift
//  Snapchat
//
//  Created by Raony Ferreira on 22/04/18.
//  Copyright © 2018 RaonyVieira. All rights reserved.
//

import UIKit
import Firebase

class SignInSignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInSignInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
             print("We tried to signin")
            
            if error != nil {
                print("There is a error:\(error)")
            } else {
                print ("Autenticado com sucesso")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        
        }
        
    }
    
}

