//
//  MainViewController.swift
//  ProyFirebase
//
//  Created by Germán Santos Jaimes on 07/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        isLogged()
    }
    
    func isLogged(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("usuario no loggeado")
                return
            }else{
                print("usuario loggeado")
                self.performSegue(withIdentifier: "welcomeView", sender: self)
            }
        }
    }

}
