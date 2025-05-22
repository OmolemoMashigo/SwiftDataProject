//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/18.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    
    @Bindable var user: User
    var body: some View {
        Form{
            TextField("Name: ", text: $user.name)
            TextField("City: ", text: $user.city)
            
            DatePicker("Date joined: ", selection: $user.joinDate)
        }
        .navigationTitle("edit user")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "John Doe", city: "NYC", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(container)
    }catch{
        return Text("failed to return container \(error.localizedDescription)")
    }
}
