//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Raony Ferreira on 24/04/18.
//  Copyright © 2018 RaonyVieira. All rights reserved.
//

import UIKit
import Firebase

class SnapsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getEmailUser()
        
    }
    
    func getEmailUser(){
        let user1 = Auth.auth().currentUser?.email
        print("\(user1!)")
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        dismiss(animated: true) {
            do {
                try Auth.auth().signOut()
                print("usuario deslogado")
            } catch {
                
            }
            
        }
        
    }
    
}
