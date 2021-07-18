//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Kenyi Rodriguez on 21/06/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        //obtienes el usuario y contraseña de las cajas de texto
        //llamar a firebase para autenticar
        
        self.loading.startAnimating()
        self.hacerLoginConFireBase {
            self.loading.stopAnimating()
            self.performSegue(withIdentifier: "HomeViewController", sender: nil)
        }
    }
    
    
    //ESTO SIMULA EL LLAMADO A FIREBASE
    func hacerLoginConFireBase(_ success: @escaping ()->Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            success()
        }
    }
    
}
