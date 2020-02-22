//
//  ViewController.swift
//  sesion3-p
//
//  Created by Karen Denise Maya Ramirez on 21/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        //performSegue(withIdentifier: "toLogin", sender: self)
    }
    @IBAction func login(_ sender: UIButton){
        //let loginView = ThirdViewController() //instacio
        let secondView = SecondViewController()
        //present(loginView, animated: true, completion: nil)
        secondView.deposito = "Ahi va la botella1"
        //navigationController?.pushViewController(loginView, animated:true)
        navigationController?.pushViewController(secondView, animated:true)
        //a donde lo vas a mandar
        //navigationController?.pushViewController(a, animated: true)
    }
        //paso de parametros
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//            let secondView = segue.destination as! SecondViewController
//            //iucontroller generico-- as! nombre especifico
//            secondView.deposito = "Ahi va la botella"
//        }
//
//    override func viewWillAppear(_ animated: Bool) { //refresca la vista
// code
//    }

}

