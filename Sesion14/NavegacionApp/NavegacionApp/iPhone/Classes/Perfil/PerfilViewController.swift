//
//  PerfilViewController.swift
//  NavegacionApp
//
//  Created by Kenyi Rodriguez on 12/07/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBAction func clickBtnCerrarSesion(_ sender: Any) {
        
        let title = "Mi Aplicación"
        let message = "¿Estas seguro que deseas cerrar sesión?"
        let accept = "Si"
        let cancel = "No"
        
        self.showAlert(title: title,
                       message: message,
                       acceptButton: accept,
                       cancelButton: cancel,
                       acceptHandler: {
            
            guard let loginController = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else { return }
            self.navigationController?.popToViewController(loginController, animated: true)
            
        }, cancelHandler: nil)

    }
}

