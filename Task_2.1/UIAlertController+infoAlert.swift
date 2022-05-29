//
//  UIAlertController+infoAlert.swift
//  MyHabits
//
//  Created by Александр on 22.09.2021.
//

import UIKit

extension UIAlertController {
    static func infoAlert(title: String, message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    static func errorAlert(message: String) -> UIAlertController {
        infoAlert(title: "Ошибка", message: message)
    }
}
