//
//  SettingsViewController.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SegmentedControlTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: SegmentedControlTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
}
