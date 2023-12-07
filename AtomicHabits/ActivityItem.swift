//
//  ActivityItem.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 07/12/2023.
//

import Foundation

struct ActivityCategory {
    // Creating a Category Section that allows to group
}

struct ActivityItem: Identifiable, Codable, Equatable {
    struct Items: Codable, Equatable {
        var goal: String
        var isCompleted: Bool
    }
    
    var id: String = UUID().uuidString
    let name: String
    let details: String
    var activityList: [Items]?
}
