//
//  ViewController.swift
//  ProyFirebase
//
//  Created by Germán Santos Jaimes on 06/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRef = Firestore.firestore()
        
    }
    
    @IBAction func createUser(_ sender: UIButton){
        guard let email = emailTF.text, email != "", let password = passwdTF.text, password != "", let name = nameTF.text, name != "", let lastname = lastnameTF.text, lastname != "" else {
            self.showMessage(message: "Falta algún dato, no se cuál.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("usuario creado", user?.user.uid)
            self.storeUser(uid: (user?.user.uid)!, name: name, lastname: lastname)
        }
        
    }
    
    @IBAction func cancel(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    func showMessage(message: String){
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true)
    }
    
    func storeUser(uid: String, name: String, lastname: String){
        var data: [String: Any] = ["name": name, "lastname": lastname]
        
        getRef.collection("users").document(uid).setData(data, completion: { (error) in
            if let error = error{
               self.showMessage(message: error.localizedDescription)
                return
            }else{
                print("Datos guardados")
            }
            
        })
    }

}

