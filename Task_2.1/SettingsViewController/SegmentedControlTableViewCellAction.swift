//
//  SegmentedControlTableViewCellAction.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

extension SegmentedControlTableViewCell {
    struct Action {
        let title: String
        let action: () -> Void
    }
}
