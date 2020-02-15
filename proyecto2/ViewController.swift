//
//  ViewController.swift
//  proyecto2
//
//  Created by Karen Denise Maya Ramirez on 15/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lomitos: [String] = ["perro","perritos2","perritos3","perritos4","perritos5"]
    var indice: Int = 0
    
    @IBOutlet weak var imagenLomito: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //imagenLomito.image = UIImage(named: lomitos[0])
        //imagen inicial
        // Do any additional setup after loading the view.
    }
    
    @IBAction func move(_ sender: UIButton){
        if sender.tag == 0{
            indice -= 1
            if indice < 0{
                indice = lomitos.count - 1
                
            }
        }else{
            indice += 1
            if indice > 4{
                indice = 0
                
            }
        }
        imagenLomito.image = UIImage(named: lomitos[indice])
    }
}

