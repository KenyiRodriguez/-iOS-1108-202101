//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Kenyi Rodriguez on 21/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func clickBtnCerrarSesion(_ sender: Any) {
        self.irAVistaEspecifica()
    }
    
    func irAlInicioDeTodaLaApp() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func irAVistaEspecifica() {
        
        guard let controller = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else {
            return
        }
        
        self.navigationController?.popToViewController(controller, animated: true)
    }
}
