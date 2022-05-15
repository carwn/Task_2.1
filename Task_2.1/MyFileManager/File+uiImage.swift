//
//  File+uiImage.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

extension File {
    var uiImage: UIImage? {
        guard let data = data else {
            return nil
        }
        return UIImage(data: data)
    }
}
