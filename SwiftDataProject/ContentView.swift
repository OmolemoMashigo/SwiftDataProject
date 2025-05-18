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
    @Query(sort: \User.name) var users: [User] //a query sorting by our users' names
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
                    let user = User(name: "", city: "", date: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
