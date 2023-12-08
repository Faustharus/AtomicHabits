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

struct ActivityItem: Identifiable, Codable, Equatable, Hashable {
//    struct Items: Codable, Equatable, Hashable {
//        var goal: String
//        var isCompleted: Bool
//    }
    
    var id: String = UUID().uuidString
    var name: String
    let details: String
    var completed: Int
    //var activityList: [Items]?
}
