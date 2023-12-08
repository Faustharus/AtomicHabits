//
//  DetailView.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 07/12/2023.
//

import SwiftUI

struct DetailView: View {
    
    var currentActivity: ActivityItem
    
    var body: some View {
        VStack {
            Text(currentActivity.details)
                .font(.title)
        }
        .navigationTitle(currentActivity.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(currentActivity: ActivityItem(name: "Test", details: "Another One", completed: 0))
    }
}
