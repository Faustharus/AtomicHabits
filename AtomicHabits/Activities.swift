//
//  Activities.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 07/12/2023.
//

import Foundation
import Observation

@Observable
class Activities {
    var activities = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([ActivityItem].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        activities = []
    }
}
