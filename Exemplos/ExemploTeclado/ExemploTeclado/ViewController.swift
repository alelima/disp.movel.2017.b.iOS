//
//  ViewController.swift
//  ExemploTeclado
//
//  Created by Pedro Henrique on 21/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint! {
        didSet {
            valorInicial = bottomConstraint.constant
        }
    }
    private var valorInicial: CGFloat = 0
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(oTecladoApareceu(_:)),
                                               name: Notification.Name.UIKeyboardDidShow,
                                               object: view.window)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(oTecladoDesapareceu(_:)),
                                               name: Notification.Name.UIKeyboardDidHide,
                                               object: view.window)
        
        
        let tapGesture = UITapGestureRecognizer(target: textField, action: #selector(UITextField.resignFirstResponder))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
   
    @objc private func oTecladoApareceu(_ sender: Notification) {
        if let frame = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            bottomConstraint.constant = bottomConstraint.constant + frame.size.height
        }
    }
    
    @objc private func oTecladoDesapareceu(_ sender: Notification) {
        bottomConstraint.constant = valorInicial
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
