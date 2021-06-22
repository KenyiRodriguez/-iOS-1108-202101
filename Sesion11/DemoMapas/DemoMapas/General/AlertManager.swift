//
//  AlertManager.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 21/06/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, acceptButton: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: acceptButton, style: .cancel, handler: nil)
        alertController.addAction(acceptAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAutomaticAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        self.present(alertController, animated: true) {
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
