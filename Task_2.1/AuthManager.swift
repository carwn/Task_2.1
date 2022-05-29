//
//  AuthManager.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import Foundation
import KeychainAccess

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {
        
    }
    
    private let keychain = Keychain(service: "com.example.netology.shelihov.task_2.1")
    private let appPasswordKey = "appPasswordKey"
    
    var passwordIsSet: Bool {
        keychain[appPasswordKey] != nil
    }
    
    func inputedPasswordIsCorrect(_ inputedPassword: String) -> Bool {
        keychain[appPasswordKey] == inputedPassword
    }
    
    func setNewPassword(_ newPassword: String) {
        keychain[appPasswordKey] = newPassword
    }
    
    func passwordMeetsSecurityRequirements(_ password: String) -> Bool {
        password.count >= 4
    }
    
    func clearPassword() {
        keychain[appPasswordKey] = nil
    }
}
