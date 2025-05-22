//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/22.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
   
    var body: some View {
        List(users){ user in
            Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{ user in //_users to make query on users array instead of changing the actual users array
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
