//
//  SecondViewController.swift
//  sesion3-p
//
//  Created by Karen Denise Maya Ramirez on 21/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var deposito: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print(deposito)
    }
    @IBAction func cerrar(_ sender: UIButton){
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }


}
