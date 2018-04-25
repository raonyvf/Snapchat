//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Raony Ferreira on 24/04/18.
//  Copyright © 2018 RaonyVieira. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getDataDatabase()()

    }
    
    func getDataDatabase(){
        Database.database().reference().child("users").observe(DataEventType.childAdded) { (snapshot) in
        print(snapshot)
            
            let user = User()
            
            user.email = snapshot.
            user.uid = snapshot.key!
            
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }



}
