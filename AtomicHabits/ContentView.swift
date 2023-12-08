//
//  ContentView.swift
//  AtomicHabits
//
//  Created by Damien Chailloleau on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var allActivities = Activities()
    @State private var isAddingNew: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if allActivities.activities.isEmpty {
                    ContentUnavailableView("No Activity", systemImage: "exclamationmark", description: Text("To add your first activity, Tap the '+' Button the top right corner of the screen "))
                        .symbolVariant(.circle)
                } else {
                    List {
                        ForEach($allActivities.activities, id: \.id) { $item in
                            NavigationLink {
                                DetailView(currentActivity: $item)
                            } label: {
                                HStack {
                                    Text("\(item.completed)")
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.details)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteActivity)
                    }
                }
            }
            .navigationTitle("Atomic Habits")
            .toolbar {
                EditButton()
                Button {
                    self.isAddingNew = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isAddingNew) {
                NewActivity(allActivities: allActivities)
            }
        }
    }
}

#Preview {
    ContentView()
}

// MARK: Functions
extension ContentView {
    
    func deleteActivity(at offsets: IndexSet) {
        allActivities.activities.remove(atOffsets: offsets)
    }
    
}
