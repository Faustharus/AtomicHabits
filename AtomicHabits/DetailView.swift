//
//  DetailView.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 07/12/2023.
//

import SwiftUI

struct DetailView: View {
    
    @State var allActivities = Activities()
    @Binding var currentActivity: ActivityItem
    
    @State private var howMany: Int = 0
    
    var body: some View {
        VStack {
            Text("How many: \(currentActivity.completed)")
                .font(.headline)
                .padding(.top, 10)
            
            Text(currentActivity.details)
                .font(.title)
            
            Button("Count") {
                currentActivity.completed += 1
                
                if let index = allActivities.activities.firstIndex(of: currentActivity) {
                    allActivities.activities[index] = currentActivity
                }
                
                howMany = currentActivity.completed
            }
        }
        .navigationTitle(currentActivity.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(currentActivity: .constant(ActivityItem(name: "Test", details: "Another One", completed: 0)))
    }
}
