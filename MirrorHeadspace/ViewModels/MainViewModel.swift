//
//  MainViewModel.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-12.
//

import Foundation

class MainViewModel {
    
    let userDataService: UserDataServiceProtocol
    let activityDataService: ActivityDataServiceProtocol
    let focusAreaDataService: FocusAreaDataServiceProtocol
    
    let activeUser: User

    var userFirstName: String {
        activeUser.firstName
    }
    
    init(userDataService: UserDataServiceProtocol, activityDataService: ActivityDataServiceProtocol, focusAreaDataService: FocusAreaDataServiceProtocol) {
        self.userDataService = userDataService
        self.activityDataService = activityDataService
        self.focusAreaDataService = focusAreaDataService
        
        self.activeUser = userDataService.getActiveUser()
    }
    
    
    
}
