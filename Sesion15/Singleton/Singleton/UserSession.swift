//
//  UserSession.swift
//  Singleton
//
//  Created by Kenyi Rodriguez on 19/07/21.
//

import Foundation

class UserSession {
    
    static private var internalSingleton: UserSession?
    
    static var singleton: UserSession? {
        self.internalSingleton
    }
    
    private let name    : String
    private let lastName: String
    let token           : String
    
    var fullName: String {
        self.name + " " + self.lastName
    }
    
    private init(name: String, lastName: String, token: String) {
        self.name       = name
        self.lastName   = lastName
        self.token      = token
    }
}

extension UserSession {
    
    class func create(name: String, lastName: String, token: String) {
        
        let objSession = UserSession(name: name, lastName: lastName, token: token)
        UserSession.internalSingleton = objSession
    }
    
    class func reset() {
        UserSession.internalSingleton = nil
    }
}
