//
//  ViewController.swift
//  proyecto1
//
//  Created by Karen Denise Maya Ramirez on 15/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter: Int = 0
    var cadena: String = "0"
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var letrero: UILabel!
    //palabrareservada(@) interface builder
    //signo de ! (si existe) aunque reciba nulo
    
    override func viewDidLoad() { //heredo y reescribo
        super.viewDidLoad()
        boton.layer.cornerRadius = 20
        //view.backgroundColor = .blue
    }


    @IBAction func click(_ sender: UIButton) {

        counter += 1
        if counter <= 10 {
            print ("click \(counter)")
            //letrero("\(counter)")
        }else{
            boton.backgroundColor = .red
        }
    }
}

