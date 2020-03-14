//
//  WelcomeViewController.swift
//  ProyFirebase
//
//  Created by Germán Santos Jaimes on 07/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any){
        var salida = try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
    }
}
