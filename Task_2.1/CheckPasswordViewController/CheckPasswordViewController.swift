//
//  CheckPasswordViewController.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

class CheckPasswordViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    
    private let authManager = AuthManager.shared
    private var firstTryPassword: String?
    private var state: CheckPasswordViewControllerState! {
        didSet {
            switch state {
            case .checkPassword:
                updateUI(textFieldPlaceholder: "Введите пароль", textFieldIsSecureTextEntry: true, buttonTitle: "Войти")
            case .inputPasswordFirst:
                updateUI(textFieldPlaceholder: "Новый пароль", textFieldIsSecureTextEntry: false, buttonTitle: "Задать пароль")
            case .inputPasswordSecond:
                updateUI(textFieldPlaceholder: "Повторите пароль", textFieldIsSecureTextEntry: false, buttonTitle: "Сохранить пароль")
            case .none:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStateFromAuthManager()
    }
    
    @IBAction func mainButtonPressed() {
        guard let password = textField.text else {
            showError("Пароль не введен")
            return
        }
        switch state {
        case .checkPassword:
            checkPasswordAndStartApp(password: password)
        case .inputPasswordFirst:
            setPasswordFirst(password: password)
        case .inputPasswordSecond:
            setPasswordSecond(password: password)
        case .none:
            break
        }
    }
    
    @IBAction func clearPasswordButtonPressed(_ sender: Any) {
        authManager.clearPassword()
        updateStateFromAuthManager()
    }
    
    private func checkPasswordAndStartApp(password: String) {
        if authManager.inputedPasswordIsCorrect(password) {
            startApp()
        } else {
            showError("Пароль не верный")
            updateStateFromAuthManager()
        }
    }
    
    private func setPasswordFirst(password: String) {
        guard authManager.passwordMeetsSecurityRequirements(password) else {
            showError("Пароль не соотвтетвует требованиям безопаснисти")
            return
        }
        firstTryPassword = password
        state = .inputPasswordSecond
    }
    
    private func setPasswordSecond(password: String) {
        guard firstTryPassword == password else {
            showError("Пароли не совпадают")
            firstTryPassword = nil
            updateStateFromAuthManager()
            return
        }
        authManager.setNewPassword(password)
        startApp()
    }
    
    private func startApp() {
        performSegue(withIdentifier: "toFirstMainScreen", sender: nil)
    }
    
    private func updateStateFromAuthManager() {
        state = authManager.passwordIsSet ? .checkPassword : .inputPasswordFirst
    }
    
    private func updateUI(textFieldPlaceholder: String, textFieldIsSecureTextEntry: Bool, buttonTitle: String) {
        textField.text = nil
        textField.placeholder = textFieldPlaceholder
        textField.isSecureTextEntry = textFieldIsSecureTextEntry
        mainButton.setTitle(buttonTitle, for: .normal)
    }
    
    private func showError(_ errorMessage: String) {
        present(UIAlertController.errorAlert(message: errorMessage), animated: true)
    }
}
