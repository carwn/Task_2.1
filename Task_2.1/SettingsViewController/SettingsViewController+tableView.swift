//
//  SettingsViewController+tableView.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SegmentedControlTableViewCell.self), for: indexPath) as! SegmentedControlTableViewCell
            cell.configure(actions: SortOption.allCases.map { sortOption in
                .init(title: sortOption.rawValue.localizedCapitalized, action: { SettingsManager.shared.sortOption = sortOption })
            })
            if let selectIndex = SortOption.allCases.firstIndex(of: SettingsManager.shared.sortOption) {
                cell.selectSegmentAtIndex(selectIndex)
            }
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            cell.textLabel?.text = "Изменить пароль"
            cell.textLabel?.textAlignment = .center
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        guard indexPath == IndexPath(row: 1, section: 0) else {
            return
        }
        print("open password change")
    }
}
