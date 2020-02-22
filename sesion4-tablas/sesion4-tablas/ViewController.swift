//
//  ViewController.swift
//  sesion4-tablas
//
//  Created by Karen Denise Maya Ramirez on 22/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
//colocando los protocolos
/*UITableViewDelegate mas de 60 metodos
 reutilizacion de celdas: se quitsa el contenido mas no las propiedades
 self: toda la clase
 */
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var nombres: [String] = ["Luis", "Pau", "Carlos", "Fer", "Xochitl"]
    var carrito: [String] = []
    
    //Siempre que se necesita info de una tabla
    @IBOutlet weak var tablita: UITableView!
    //metodos de clase
    override func viewDidLoad() {
        super.viewDidLoad()
    //datos
    }
    
    //metodos heredados
    //sobrecargada de metodos (mismo nombre)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 4
        return nombres.count
    }
    //indexPath ¿Cuál renglon eres?, desplegar en pantalla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //cell.textLabel?.text = "Hola"
        cell.textLabel?.text = nombres[indexPath.row]
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .red
        }else{
           cell.backgroundColor = .blue
        }
        return cell
    }
    
    //Buscar metodos por los parametros
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let cell = tableView.cellForRow(at: indexPath) //obtiene las celas fisicamente
        cell?.accessoryType = .checkmark
        print(indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView = segue.destination as! DetailViewController
        let myIndexPath = tablita.indexPathForSelectedRow
        detailView.item = nombres[myIndexPath!.row]
        detailView.vc = self
        
    }
    
    func refresh(){
        print(carrito)
    }

}

