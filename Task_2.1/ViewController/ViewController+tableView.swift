//
//  ViewController+tableView.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 15.05.2022.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
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
}
