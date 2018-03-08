//
//  TelaLaranjadaViewController.swift
//  ExemploAula05
//
//  Created by Pedro Henrique on 07/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class TelaLaranjadaViewController: UIViewController {

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "mudaDeTelaComTrianguloSegue" {
                segue.destination.title = "Tela em Branco"
            }
        }
    }
}
