//
//  NewActivity.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 07/12/2023.
//

import SwiftUI

struct NewActivity: View {
    
    @Environment(\.dismiss) var dismiss
    
    let allActivities: Activities
    
    @State private var name: String = ""
    @State private var details: String = ""
    
    var body: some View {
        Form {
            Section("Activity Name") {
                TextField("Name", text: $name)
            }
            
            Section("Activity Description") {
                TextField("Description Text", text: $details)
            }
            
            Section("Confim") {
                Button("Save") {
                    let newActivity = ActivityItem(name: name, details: details, completed: 0)
                    allActivities.activities.append(newActivity)
                    dismiss()
                }
            }
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    NewActivity(allActivities: Activities())
}
