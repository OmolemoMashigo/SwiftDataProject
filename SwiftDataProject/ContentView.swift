//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/18.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingUsers = false
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    
    @State private var path = [User]()
    var body: some View {
        NavigationStack(path: $path){
            
            UsersView(minimumJoinDate: showingUpcomingUsers ? .now : .distantPast, sortOrder: sortOrder)
            
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ user in
                EditUserView(user: user)
            }
            
            .toolbar{
                Button("add user", systemImage: "plus"){
                    try? modelContext.delete(model: User.self)// delete all existing user objects
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Parks", city: "NYC", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Omolemo Halman Martin Mashigo", city: "Pretoria", joinDate: .now.addingTimeInterval(86400 * 10))
                    let fourth = User(name: "Skepta", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                }
                Button(showingUpcomingUsers ? "show everyone" : "show upcomming"){
                    showingUpcomingUsers.toggle()
                }
                
                Menu("sort", systemImage: "arrow.up.arrow.down"){
                    Picker("sort", selection: $sortOrder){
                        Text("sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("sort by join date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
