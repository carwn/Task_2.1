//
//  ImageSaver.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    private weak var delegate: ImageSaverDelegate?
    private var fileManager: MyFileManager
    
    init(delegate: ImageSaverDelegate, fileManager: MyFileManager) {
        self.delegate = delegate
        self.fileManager = fileManager
        super.init()
    }
    
    func start() {
        let pickerVC = UIImagePickerController()
        pickerVC.delegate = self
        pickerVC.allowsEditing = false
        pickerVC.mediaTypes = ["public.image"]
        delegate?.presentUIImagePickerController(pickerVC)
    }
    
    func saveImage(title: String, image: UIImage) {
        do {
            try fileManager.saveFile(File(title: title, data: image.jpegData(compressionQuality: 1.0)))
            delegate?.imageSavedSuccessfully()
        } catch {
            delegate?.errorSavingImage(error: error)
        }
    }
}

extension ImageSaver: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let url = info[.imageURL] as? URL, let image = info[.originalImage] as? UIImage {
            saveImage(title: url.lastPathComponent, image: image)
        } else {
            delegate?.errorSavingImage(error: ImageSaverError.noImageFromPicker)
        }
        picker.dismiss(animated: true)
    }
}

extension ImageSaver: UINavigationControllerDelegate {
    
}
