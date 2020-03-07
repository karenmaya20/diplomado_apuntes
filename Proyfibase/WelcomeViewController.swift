//
//  WelcomeViewController.swift
//  Proyfibase
//
//  Created by Karen Denise Maya Ramirez on 07/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func signOut(_ sender: Any){
        var salida = try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
    }
    

}
