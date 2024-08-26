//
//  ProfileViewModel.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-12.
//

import Foundation

class ProfileViewModel {
    
    private let user: User
    let dataService: ActivityDataServiceProtocol
    
    var userName: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    var userJoinDate: Date {
        user.joinDate
    }
    
    var userTotalMeditationMinutes: Int {
        user.totalMeditationMinutes
    }
    var userSessionCount: Int {
        user.numberOfSessions
    }
    var averageSessionMinutes: Int {
        user.totalMeditationMinutes / user.numberOfSessions
    }
    
    var recentActivities: ActivityList {
        dataService.fetchActivityList(for: .recent)
    }
    
    init(dataService: ActivityDataServiceProtocol, user: User) {
        self.user = user
        self.dataService = dataService
    }
    
    
}
