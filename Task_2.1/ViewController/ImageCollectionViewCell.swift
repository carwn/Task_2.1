//
//  ImageCollectionViewCell.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 16.05.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func configure(file: File) {
        imageView.image = file.uiImage
    }
}
