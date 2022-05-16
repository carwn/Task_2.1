//
//  MyFileManager.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import Foundation

class MyFileManager {
    
    private let fileManager = FileManager.default
    private var documentDirectory: URL? {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func files() throws -> [File] {
        guard let documentDirectory = documentDirectory else {
            throw MyFileManagerError.cantGetDocumentDirectory
        }
        let fileURLs = try fileManager.contentsOfDirectory(at: documentDirectory,
                                                           includingPropertiesForKeys: nil,
                                                           options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles])
        return fileURLs.map { File(title: $0.lastPathComponent, data: fileManager.contents(atPath: $0.path)) }
    }
    
    func saveFile(_ file: File) throws {
        guard let documentDirectory = documentDirectory else {
            throw MyFileManagerError.cantGetDocumentDirectory
        }
        let fileURL = documentDirectory.appendingPathComponent(file.title)
        let result = fileManager.createFile(atPath: fileURL.path, contents: file.data, attributes: nil)
        if !result {
            throw MyFileManagerError.cantCreateFile
        }
    }
    
    func removeFile(name: String) throws {
        guard let documentDirectory = documentDirectory else {
            throw MyFileManagerError.cantGetDocumentDirectory
        }
        try fileManager.removeItem(at: documentDirectory.appendingPathComponent(name))
    }
}
