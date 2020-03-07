//
//  SecondViewController.swift
//  comunicateView
//
//  Created by Karen Denise Maya Ramirez on 06/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate{
    func showData(_ name: String)
}
class SecondViewController: UIViewController {
    var delegate: SecondViewControllerDelegate?
    @IBOutlet weak var nameTF: UITextField!
    
    var testButton: UIButton = {
        var b = UIButton(type: .system)
        b.setTitle("Haz click", for: .normal)
        b.backgroundColor = .red
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        view.addSubview(testButton)
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @IBAction func saveName(_ sender: UIButton){
        //orden del jefe
        if let name = nameTF.text{
            delegate?.showData(name) //uses
            dismiss(animated: true, completion: nil)
        }
    }
    
}//class Second
