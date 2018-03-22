//
//  ViewController.swift
//  ExemploMultithread
//
//  Created by Pedro Henrique on 21/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let enderecoDaImagem = "https://upload.wikimedia.org/wikipedia/commons/5/51/Jordan-19A-017_-_A_really_big_sandbox.jpg"
    
    var imagem : UIImage? {
        didSet{
            DispatchQueue.main.async(execute: exibirImagem)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        globalQueue.async(execute: baixarImagem)
        
    }
    
    private func exibirImagem() {
        guard let img = self.imagem else { return }
        imageView.image = img
        activityIndicator.stopAnimating()
    }
    
    private func baixarImagem() {
        if let url = URL(string: enderecoDaImagem) {
            do {
                let data = try Data(contentsOf: url)
                imagem = UIImage(data: data)
            }catch {
                debugPrint(error)
                DispatchQueue.main.async(execute: activityIndicator.stopAnimating)
            }
        }
    }
    
    
}

