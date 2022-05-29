//
//  SettingsManager.swift
//  Task_2.1
//
//  Created by Александр Шелихов on 29.05.2022.
//

import Foundation

class SettingsManager {
    
    static let shared = SettingsManager()
    
    private init() {
        
    }
    
    private let userDefaults = UserDefaults.standard
    
    var sortOption: SortOption {
        get {
            if let rawValue = userDefaults.string(forKey: Keys.sortOption.rawValue),
               let sortOption = SortOption(rawValue: rawValue) {
                return sortOption
            } else {
                return SortOption.allCases.first!
            }
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Keys.sortOption.rawValue)
            print("new sort option:", newValue)
        }
    }
}

private extension SettingsManager {
    enum Keys: String {
        case sortOption
    }
}
