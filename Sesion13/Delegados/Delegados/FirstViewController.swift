//
//  ViewController.swift
//  Delegados
//
//  Created by Kenyi Rodriguez on 5/07/21.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension FirstViewController: ViewBoxDelegate {
    
    func viewBox(_ viewBox: ViewBox, didTapViewWithGesture gesture: UITapGestureRecognizer) {
        
        if viewBox.nombreColor == "azul" {
            print("TOCO EL AZUL: siguiente paso")
            
        } else if viewBox.nombreColor == "verde" {
            print("TOCO EL VERDE: anterior paso")
            
        }
    }
}

