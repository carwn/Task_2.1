//
//  ViewController+ImageSaverDelegate.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

extension ImagesViewController: ImageSaverDelegate {
    func presentUIImagePickerController(_ vc: UIImagePickerController) {
        present(vc, animated: true)
    }
    
    func imageSavedSuccessfully() {
        reloadFiles()
    }
    
    func errorSavingImage(error: Error) {
        showError(error)
    }
}
