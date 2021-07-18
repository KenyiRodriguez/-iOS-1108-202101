//
//  SecondViewController.swift
//  Delegados
//
//  Created by Kenyi Rodriguez on 5/07/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension SecondViewController: ViewBoxDelegate {
    
    func viewBox(_ viewBox: ViewBox, didTapViewWithGesture gesture: UITapGestureRecognizer) {
        
        if viewBox.nombreColor == "morado" {
            print("TOCO EL MORADO: vamos arriba")
            
        }  else if viewBox.nombreColor == "celeste" {
            print("TOCO EL CELESTE: vamos abajo")
            
        }
    }
}
