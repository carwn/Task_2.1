//
//  SegmentedControlTableViewCell.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import UIKit

class SegmentedControlTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    private var actions: [Action] = [] {
        didSet {
            segmentedControl.removeAllSegments()
            actions.enumerated().forEach { action in
                segmentedControl.insertSegment(withTitle: action.element.title, at: action.offset, animated: false)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        actions.removeAll()
    }
    
    func configure(actions: [Action]) {
        self.actions = actions
    }
    
    func selectSegmentAtIndex(_ index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
    
    @IBAction func segmentedControlValueChanged() {
        actions[segmentedControl.selectedSegmentIndex].action()
    }
}
