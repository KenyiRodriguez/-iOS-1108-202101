//
//  AlertManager.swift
//  NavegacionApp
//
//  Created by Kenyi Rodriguez on 12/07/21.
//

import UIKit

extension UIViewController {
    
    typealias CallBackAlertAction = () -> Void
    
    func showAlert(title: String, message: String, acceptButton: String, cancelButton: String, acceptHandler: CallBackAlertAction?, cancelHandler: CallBackAlertAction?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        let acceptAction = UIAlertAction(title: acceptButton, style: .default) { action in
            acceptHandler?()
        }
        
        let cancelAction = UIAlertAction(title: cancelButton, style: .cancel) { action in
            cancelHandler?()
        }
        
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
