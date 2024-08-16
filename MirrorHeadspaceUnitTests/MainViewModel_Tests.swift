//
//  MainViewModel_Tests.swift
//  MirrorHeadspaceUnitTests
//
//  Created by Erica Sampson on 2024-08-14.
//

import XCTest
@testable import MirrorHeadspace

final class MainViewModel_Tests: XCTestCase {
    
    var activityDataService: MockActivityDataService?
    var focusAreaDataService: MockFocusAreaDataService?
    var userDataService: MockUserDataService?

    override func setUpWithError() throws {
        activityDataService = MockActivityDataService()
        focusAreaDataService = MockFocusAreaDataService()
        userDataService = MockUserDataService()
    }

    override func tearDownWithError() throws {
        activityDataService = nil
        focusAreaDataService = nil
        userDataService = nil
    }

    func test_MainViewModel_init_dataServicesNotNil() {
        
        //Given
        //When
        var mainVM: MainViewModel
        if let userDataService = userDataService, let activityDataService = activityDataService, let focusAreaDataService = focusAreaDataService {
            
            mainVM = MainViewModel(userDataService: userDataService,
                          activityDataService: activityDataService,
                          focusAreaDataService: focusAreaDataService)
        } else {
            XCTFail("Data services not initialized")
            return
        }
        
        //Then
        XCTAssertNotNil(mainVM.activityDataService)
        XCTAssertNotNil(mainVM.userDataService)
        XCTAssertNotNil(mainVM.focusAreaDataService)
    }
    
    func test_MainViewModel_activeUser_userSetCorrectly() {
        
        //Given
        var mockUser = User(firstName: "First",
                        lastName: "Last",
                        joinDate: Date.now,
                        totalMeditationMinutes: 500,
                        numberOfSessions: 10)
        
        userDataService = MockUserDataService(user: mockUser)

        var mainVM: MainViewModel
        if let userDataService = userDataService, let activityDataService = activityDataService, let focusAreaDataService = focusAreaDataService {
            
            mainVM = MainViewModel(userDataService: userDataService,
                          activityDataService: activityDataService,
                          focusAreaDataService: focusAreaDataService)
        } else {
            XCTFail("Data services not initialized")
            return
        }
        
        //When
        let user = mainVM.activeUser
        
        //Then
        XCTAssertNotNil(user)
        XCTAssertEqual(user.id, mockUser.id)
    }
    
    func test_MainViewModel_activeUser_firstNameCorrect() {
        
        //Given
        var mockUser = User(firstName: "First",
                        lastName: "Last",
                        joinDate: Date.now,
                        totalMeditationMinutes: 500,
                        numberOfSessions: 10)
        
        userDataService = MockUserDataService(user: mockUser)

        var mainVM: MainViewModel
        if let userDataService = userDataService, let activityDataService = activityDataService, let focusAreaDataService = focusAreaDataService {
            
            mainVM = MainViewModel(userDataService: userDataService,
                          activityDataService: activityDataService,
                          focusAreaDataService: focusAreaDataService)
        } else {
            XCTFail("Data services not initialized")
            return
        }
        
        //When
        let firstName = mainVM.userFirstName
        
        //Then
        XCTAssertEqual(firstName, mockUser.firstName)
    }

}

struct MockActivityDataService: ActivityDataServiceProtocol {
    func getMorningActivities() -> [MirrorHeadspace.Activity] { [] }
    
    func getAfternoonActivities() -> [MirrorHeadspace.Activity] { [] }
    
    func getEveningActivities() -> [MirrorHeadspace.Activity] { [] }
    
    func getRecentActivities(title: String?) -> MirrorHeadspace.ActivityList {
        ActivityList(activities: [], title: title ?? "")
    }
    
    func getFavoriteActivities(title: String?) -> MirrorHeadspace.ActivityList {
        ActivityList(activities: [], title: title ?? "")
    }
}

struct MockFocusAreaDataService: FocusAreaDataServiceProtocol {
    func getFocusAreas() -> [MirrorHeadspace.FocusArea] {
        [FocusArea(title: "Focus",
                  colorTheme: .blue,
                   featuredActivity: Activity(title: "Activity",
                                              description: "",
                                              activityType: .meditation,
                                              mediaType: .video,
                                              maxDuation: 5),
                  recentActivities: nil,
                  recommendedActivities: [],
                  dailyActivity: nil,
                  collections: [])]
    }
}

struct MockUserDataService: UserDataServiceProtocol {
    
    private let user: User
    
    init(user: User? = nil) {
        if let user = user {
            self.user = user
        } else {
            self.user = User(firstName: "First", 
                             lastName: "Last",
                             joinDate: Date.now,
                             totalMeditationMinutes: 500,
                             numberOfSessions: 10)
        }
    }
    
    func getActiveUser() -> MirrorHeadspace.User {
        user
    }
}
