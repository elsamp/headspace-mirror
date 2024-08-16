//
//  User.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import Foundation


struct User: Identifiable {
    
    let id: String
    let firstName: String
    let lastName: String
    let joinDate: Date
    
    let totalMeditationMinutes: Int
    let numberOfSessions: Int
    
    init(id: String = UUID().uuidString, firstName: String, lastName: String, joinDate: Date, totalMeditationMinutes: Int, numberOfSessions: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.joinDate = joinDate
        self.totalMeditationMinutes = totalMeditationMinutes
        self.numberOfSessions = numberOfSessions
    }
}
