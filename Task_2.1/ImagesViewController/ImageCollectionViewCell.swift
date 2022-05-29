//
//  ImageCollectionViewCell.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 16.05.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    private var deleteClosure: (() -> Void)?
    
    func configure(file: File, deleteClosure: @escaping () -> Void) {
        imageView.image = file.uiImage
        self.deleteClosure = deleteClosure
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteClosure?()
    }
}
