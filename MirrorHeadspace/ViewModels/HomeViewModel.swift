//
//  HomeViewModel.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-04.
//

import Foundation

class HomeViewModel {
    
    let dataService: ActivityDataServiceProtocol
    
    init(dataService: ActivityDataServiceProtocol) {
        self.dataService = dataService
    }
    
    func getActivityList(for useCase: ActivityListUseCase) -> ActivityList {
        dataService.fetchActivityList(for: useCase)
    }
    
}
