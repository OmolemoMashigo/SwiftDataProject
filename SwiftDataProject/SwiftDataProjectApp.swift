//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/18.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
