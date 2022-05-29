//
//  CheckPasswordViewController.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

class CheckPasswordViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed() {
        performSegue(withIdentifier: "toFirstMainScreen", sender: nil)
    }
}
