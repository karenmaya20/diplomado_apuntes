//
//  TunesTableViewController.swift
//  sesion5-iTune
//
//  Created by Karen Denise Maya Ramirez on 28/02/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class TunesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1 //numero de secciones
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10 //numero de renglones
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel!.text = "Celda \(indexPath.row)" //(!) te garantizo que habrá texto
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Algo paso")
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Permite el swip izquierda a derecha lead o si es de derecha a izquierda tail
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionOne = UIContextualAction(style: .normal, title: "Action 1") {
            (action, sourceView, completionHandler) in
            print("Ejecuto la accion 1")
        }
        let actionTwo = UIContextualAction(style: .normal, title: "Action 2") {
            (action, sourceView, completionHandler) in
            print("Ejecuto la accion 2")
        }
        actionOne.backgroundColor = .cyan
        actionTwo.backgroundColor = .blue
        // Para poner iconos
//        actionOne.image = UIImage(systemName: "play")
//        actionTwo.image = UIImage(systemName: "pause")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [actionOne, actionTwo])
        return swipeConfiguration
   
    }

    //de derecha a izquierda tread
    
    //Dentro aparecerá un alert controller (Vista) -> contexto
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Seleccione un godin", message: "Usted ha seleccionado a un buen godín", preferredStyle: .alert) //.actionSheet
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true) //presentas la vista
        

    }
    
    
    
    
    
    
}//final
