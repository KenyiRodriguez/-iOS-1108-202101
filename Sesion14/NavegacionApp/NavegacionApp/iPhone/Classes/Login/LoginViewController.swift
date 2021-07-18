//
//  LoginViewController.swift
//  NavegacionApp
//
//  Created by Kenyi Rodriguez on 12/07/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        //Consumir el servicio web de login.
        //Esperar a que me responda
        //En el callback de respuesta, debo enviar al tabBar
        
        self.performSegue(withIdentifier: "TabBarApplication", sender: nil)
    }
    
}
