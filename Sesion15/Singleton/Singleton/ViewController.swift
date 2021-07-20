//
//  ViewController.swift
//  Singleton
//
//  Created by Kenyi Rodriguez on 19/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.verifySession()
    }
    
    func verifySession() {
        
        guard let userSession = UserSession.singleton else {
            print("La sesión no existe")
            return
        }
        
        print(userSession.fullName)
    }
    
    func verifySession2() {
        print(UserSession.singleton?.fullName ?? "La sesión no existe")
    }
    
    func logout() {
        
        UserSession.reset()
        UserSession.create(name: <#T##String#>, lastName: <#T##String#>, token: <#T##String#>)

    }
}

