//
//  LoginViewController.swift
//  ProyFirebase
//
//  Created by Germán Santos Jaimes on 07/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton){
        guard let email = emailTF.text, email != "", let password = passwordTF.text, password != "" else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                print("usuario autenticado")
                let welcomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController
                
                self.dismiss(animated: true) {
                    self.navigationController?.pushViewController(welcomeView!, animated: true)
                }
                
                
                
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
}
