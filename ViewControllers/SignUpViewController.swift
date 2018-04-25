//
//  SignUpViewController.swift
//  Snapchat
//
//  Created by Raony Ferreira on 22/04/18.
//  Copyright © 2018 RaonyVieira. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var labelAlert: UILabel!
    @IBOutlet weak var alreadyUserTextField: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if passwordTextField.text == rePasswordTextField.text {
            Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                print("We tried to create a user")
                
                if error != nil {
                    print("There is a error")
                } else {
                    print("Usuário criado com sucesso")
                    
                   let users =  Database.database().reference().child("users")
                    users.child(user!.uid).child("email").setValue(user!.email)
                    
                    self.performSegue(withIdentifier: "goBackSegue", sender: nil)
                }
            }
        } else {
            self.labelAlert.text = "Senhas não conferem"
        }
        
        
    }
        

    
}
