//
//  ImageSaverDelegate.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

protocol ImageSaverDelegate: AnyObject {
    func presentUIImagePickerController(_: UIImagePickerController)
    func imageSavedSuccessfully()
    func errorSavingImage(error: Error)
}
