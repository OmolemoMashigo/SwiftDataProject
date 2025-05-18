//
//  User.swift
//  SwiftDataProject
//
//  Created by Omolemo Mashigo on 2025/05/18.
//

import Foundation
import SwiftData

@Model
class User{
    var name: String
    var city: String
    var date: Date
    
    init(name: String, city: String, date: Date) {
        self.name = name
        self.city = city
        self.date = date
    }
}

