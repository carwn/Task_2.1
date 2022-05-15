//
//  MyFileManagerError.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import Foundation

enum MyFileManagerError: Error {
    case cantGetDocumentDirectory
    case cantCreateFile
}
