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
                List {
                    ForEach(allActivities.activities, id: \.id) { item in
                        NavigationLink {
                            DetailView()
                        } label: {
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
            }
            .navigationTitle("Atomic Habits")
            .toolbar {
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
