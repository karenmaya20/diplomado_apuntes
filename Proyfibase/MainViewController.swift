//
//  MainViewController.swift
//  Proyfibase
//
//  Created by Karen Denise Maya Ramirez on 07/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        isLogged()
        // Do any additional setup after loading the view.
    }
    
    func isLogged(){
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user == nil{
                print("Usuario no loggeado")
                return
            }else{
                print("Usuario loggeado")
                self.performSegue(withIdentifier: "welcomeView", sender: self)
            }
        }
    }

}
