//
//  MasterTableViewController.swift
//  ExemploAula06
//
//  Created by Pedro Henrique on 14/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        var color = UIColor.black
        switch index {
            case 0: color = UIColor.blue
            case 1: color = UIColor.green
            case 2: color = UIColor.yellow
            default: break
        }
        
        //Remove a seleção da célula antes da troca de tela
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "mostrarCorSegue", sender: color)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarCorSegue" {
            if let destination = segue.destination as? ViewController {
                destination.color = sender as? UIColor
            }
            
        }
    }
    
}












