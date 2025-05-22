//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/22.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
   
    var body: some View {
        List(users){ user in
            HStack{
                Text(user.name)
                
                Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{ user in //_users to make query on users array instead of changing the actual users array
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample(){
        let sampleUser = User(name: "Pier Pipper", city: "London", joinDate: .now)
        
        let job1 = Job(name: "steal kids", priority: 3)
        let job2 = Job(name: "play flute", priority: 4)
        
        modelContext.insert(sampleUser)
        
        sampleUser.jobs.append(job1)
        sampleUser.jobs.append(job2)
        
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
