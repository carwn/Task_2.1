//
//  ViewController+tableView.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

extension ImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let file = files[indexPath.row]
        cell.textLabel?.text = file.title
        cell.imageView?.image = file.uiImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        let fileName = files[indexPath.row].title
        do {
            try fileManager.removeFile(name: fileName)
            reloadFiles()
        } catch {
            showError(error)
        }
    }
}
