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
    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("R"){
            if user.city == "Pretoria"{
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }, sort: \User.name) var users: [User] //a query sorting by our users' names
    
    @State private var path = [User]()
    var body: some View {
        NavigationStack(path: $path){
            List(users){ user in
                NavigationLink(value: user){
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ user in
                EditUserView(user: user)
            }
            
            .toolbar{
                Button("add user", systemImage: "plus"){
                    try? modelContext.delete(model: User.self)// delete all existing user objects
                    
                    let first = User(name: "Ed Sheeran", city: "London", date: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Parks", city: "NYC", date: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Omolemo Halman Martin Mashigo", city: "Pretoria", date: .now.addingTimeInterval(86400 * -10))
                    let fourth = User(name: "Skepta", city: "London", date: .now.addingTimeInterval(86400 * -10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
