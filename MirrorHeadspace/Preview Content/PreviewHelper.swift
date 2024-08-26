//
//  PreviewHelper.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import Foundation

struct PreviewHelper: FocusAreaDataServiceProtocol, ActivityDataServiceProtocol, UserDataServiceProtocol {
    
    
    static let shared = PreviewHelper()
    
    private init() { }
    
    func exampleUser() -> User {
        User(firstName: "Anita", lastName: "Markov", joinDate: Date.now, totalMeditationMinutes: 530, numberOfSessions: 23)
    }
    
    func getActiveUser() -> User {
        exampleUser()
    }
    
    func exampleActivity() -> Activity {
        Activity(title: "Pause With 5 Calming Breaths",
                 description: "Notice the sense of calm that arises as you follow the natural rythm of your body and focus on five deep breaths.",
                 activityType: .mindfulActivity, mediaType: .video, minDuration: 1, maxDuation: 3)
    }
    
    func exampleActivityArray() -> [Activity]{
        
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "This is a short description for placeholder.", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete),
            Activity(title: "Embracing the Unknown", description: "This is a short description for placeholder.", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active),
            Activity(title: "The Rythm of Life", description: "This is a short description for placeholder.", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20),
            Activity(title: "Pro | Level 3", description: "This is a short description for placeholder.", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20)
            
        ]
        
        return list
    }
    
    func exampleMorningActivityArray() -> [Activity]{
        exampleActivityArray()
    }
    
    func exampleAfternoonActivityArray() -> [Activity] {
        return [Activity(title: "Strees Release", description: "", activityType: .workout, mediaType: .video, maxDuation: 29)]
    }
    
    func exampleEveningActivityArray() -> [Activity] {
        return [Activity(title: "Botanical Building", description: "", activityType: .sleepcase, mediaType: .audio, maxDuation: 45)]
    }
    
    func exampleFavoriteActivityList(title: String = "Favorites") -> ActivityList{
        
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete, isFavorite: true),
            Activity(title: "Embracing the Unknown", description: "", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active, isFavorite: true),
            Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20, isFavorite: true),
            Activity(title: "Pro | Level 3", description: "", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20, isFavorite: true)
            
        ]
        
        return ActivityList(activities: list, title: title, bannerText: "Find all your favorite meditations and exercises here.")
    }
    
    func exampleRecentActivityList(title: String = "Recent") -> ActivityList {
        
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete),
            Activity(title: "Embracing the Unknown", description: "", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active, isFavorite: true),
            Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20),
            Activity(title: "Pro | Level 3", description: "", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20)
            
        ]
        
        return ActivityList(activities: list, title: title)
    }
    
    func exampleActivityList(activities: [Activity]? = nil, title: String = "Activities") -> ActivityList {
        ActivityList(activities: activities ?? exampleActivityArray(), title: title)
    }
    
    func exampleFocusArea(title: String, colorTheme: ColorTheme) -> FocusArea {
        FocusArea(title: title,
                  colorTheme: colorTheme,
                  featuredActivity: exampleActivity(),
                  recentActivities: [exampleActivity(), exampleActivity(), exampleActivity()],
                  recommendedActivities: [exampleActivity(), exampleActivity(), exampleActivity()],
                  dailyActivity: Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20),
                  collections: [exampleCollection(),
                                exampleSimpleCollection(title: "Podcasts"),
                                exampleSimpleCollection(title: "Gold Medal Mindset"),
                                exampleSimpleCollection(title: "Happier Holidays")])
    }
    
    
    
    func exampleCollection() -> ActivityCollection {
        
        let featuredList = ActivityList(activities: [
            Activity(title: "Calming Election Anxiety", description: "Focus on what's in your control", activityType: .meditation, mediaType: .audio, maxDuation: 8),
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete),
        ], title: "Featured")
        
        return ActivityCollection(title: "Politics Without Panic",
                                  description: "Stress-releaving tools for election season so you can hear yourself think, and make yourself heard.",
                                  featuredLists: [featuredList],
                                  activityLists: [exampleRecentActivityList(), exampleFavoriteActivityList()])
    }
    
    func exampleSimpleCollection(title: String) -> ActivityCollection {
        
        return ActivityCollection(title: title,
                                  description: "",
                                  featuredLists: [],
                                  activityLists: [])
    }
    
    //MARK: ExploreViewDataSource
    func getFocusAreas() -> [FocusArea] {
        
        var focusAreas = [FocusArea]()
        focusAreas.append(exampleFocusArea(title: "Meditate", colorTheme: .orange))
        focusAreas.append(exampleFocusArea(title: "Sleep", colorTheme: .purple))
        focusAreas.append(exampleFocusArea(title: "Focus", colorTheme: .blue))
        focusAreas.append(exampleFocusArea(title: "Move", colorTheme: .pink))
        
        return focusAreas
    }
    
    //MARK: HomeViewDataSource
    func fetchActivityList(for useCase: ActivityListUseCase) -> ActivityList {
        switch useCase {
        case .recent:
            return getRecentActivities(title: "Recent")
        case .favorite:
            return getFavoriteActivities(title: "Favorite")
        case .dailySuggestedMorning:
            return ActivityList(activities: getMorningActivities(), title: "Start your day")
        case .dailySuggestedAfternoon:
            return ActivityList(activities: getAfternoonActivities(), title: "Your afternoon lift")
        case .dailySuggestedEvening:
            return ActivityList(activities: getEveningActivities(), title: "At night")
        }
    }
    
    func getMorningActivities() -> [Activity] {
        exampleMorningActivityArray()
    }
    
    func getAfternoonActivities() -> [Activity] {
        exampleAfternoonActivityArray()
    }
    
    func getEveningActivities() -> [Activity] {
        exampleEveningActivityArray()
    }
    
    func getRecentActivities(title: String?) -> ActivityList {
        exampleRecentActivityList(title: title ?? "Recent")
    }
    
    func getFavoriteActivities(title: String?) -> ActivityList {
        exampleFavoriteActivityList(title: title ?? "Favorite")
    }
    
}

