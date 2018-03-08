//
//  ViewController.swift
//  ExemploAula05
//
//  Created by Pedro Henrique on 07/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            let action = #selector(ViewController.pan(recognizer:))
            let pan = UIPanGestureRecognizer(target: self, action: action)
            faceView.addGestureRecognizer(pan)
        }
    }
    
    @objc private func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
            case .changed: fallthrough
            case .ended:
                faceView.center = recognizer.location(in: self.view)
            default: break
        }
    }
    
}

