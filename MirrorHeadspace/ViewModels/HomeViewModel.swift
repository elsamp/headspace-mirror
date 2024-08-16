//
//  HomeViewModel.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-04.
//

import Foundation

class HomeViewModel {
    
    let dataService: ActivityDataServiceProtocol
    let morningActivities: [Activity]
    let afternoonActivities: [Activity]
    let eveningActivities: [Activity]
    
    init(dataService: ActivityDataServiceProtocol) {
        self.dataService = dataService
        self.morningActivities = dataService.getMorningActivities()
        self.afternoonActivities = dataService.getAfternoonActivities()
        self.eveningActivities = dataService.getEveningActivities()
    }
    
    func recentActivities() -> ActivityList {
        dataService.getRecentActivities(title: nil)
    }
    
    func favoriteActivities() -> ActivityList {
        dataService.getFavoriteActivities(title: nil)
    }
    
}
