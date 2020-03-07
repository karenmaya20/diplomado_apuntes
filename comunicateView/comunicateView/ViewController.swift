import UIKit



class ViewController: UIViewController, SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toSecondView(_ sender: UIButton){
        //let secondView = SecondViewController()
        let secondView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        secondView?.delegate = self
        present(secondView!, animated : true)
    }
    
    func showData(_ name: String) {
        print(name) //valores entre dos vistas
    }
    



}

