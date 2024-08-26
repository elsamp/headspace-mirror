//
//  SampleDataLoader.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-31.
//

import Foundation

struct Response: Decodable {
    let focusArea: FocusArea
}

struct MockDataService: FocusAreaDataServiceProtocol, ActivityDataServiceProtocol, UserDataServiceProtocol {
    
    //MARK: UserDataServiceProtocol
    func getActiveUser() -> User {
        User(firstName: "Anita", lastName: "Markov", joinDate: Date.now, totalMeditationMinutes: 530, numberOfSessions: 23)
    }
    
    //MARK: FocusAreaDataServiceProtocol
    func getFocusAreas() -> [FocusArea] {
        
        var focusAreas = [FocusArea]()
        if let meditateFocusArea = loadSampleFocusArea(fileName: "meditate") {
            focusAreas.append(meditateFocusArea)
        }
        if let sleepFocusArea = loadSampleFocusArea(fileName: "sleep") {
            focusAreas.append(sleepFocusArea)
        }
        if let sleepFocusArea = loadSampleFocusArea(fileName: "move") {
            focusAreas.append(sleepFocusArea)
        }
        if let sleepFocusArea = loadSampleFocusArea(fileName: "focus") {
            focusAreas.append(sleepFocusArea)
        }
        
        return focusAreas
    }
    
    private func loadSampleFocusArea(fileName: String) -> FocusArea? {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("could not find file")
            return nil
        }

        do {
            //print("fetched URL: \(url)")
            let data = try Data(contentsOf: url)
            
            //print("fetched Data: \(data)")
            let response = try JSONDecoder().decode(Response.self, from: data)
            
            //print("decoded Json: \(response.focusArea)")
            return response.focusArea
            
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            fatalError()
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key.stringValue)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch {
            print("error: ", error)
            fatalError()
        }
        
    }
    
    //MARK: ActivityDataServiceProtocol
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
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete),
            Activity(title: "Embracing the Unknown", description: "", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active),
            Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20),
            Activity(title: "Pro | Level 3", description: "", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20)

            ]
        
        return list
    }
    
    func getAfternoonActivities() -> [Activity] {
        return [Activity(title: "Strees Release", description: "", activityType: .workout, mediaType: .video, maxDuation: 29)]
    }
    
    func getEveningActivities() -> [Activity] {
        return [Activity(title: "Botanical Building", description: "", activityType: .sleepcase, mediaType: .audio, maxDuation: 45)]
    }
    
    func getRecentActivities(title: String?) -> ActivityList {
        
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete),
            Activity(title: "Embracing the Unknown", description: "", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active, isFavorite: true),
            Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20),
            Activity(title: "Pro | Level 3", description: "", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20)

            ]
        
        return ActivityList(activities: list, title: title ?? "Recent")
        
    }
    
    func getFavoriteActivities(title: String?) -> ActivityList {
        let list = [
            
            Activity(title: "Pause With 5 Calming Breaths", description: "", activityType: .mindfulActivity, mediaType: .video, maxDuation: 1, status: .complete, isFavorite: true),
            Activity(title: "Embracing the Unknown", description: "", activityType: .wakeUp, mediaType: .video, minDuration: 3, maxDuation: 7, status: .active, isFavorite: true),
            Activity(title: "The Rythm of Life", description: "", activityType: .dailyMeditation, mediaType: .audio, minDuration: 3, maxDuation: 20, isFavorite: true),
            Activity(title: "Pro | Level 3", description: "", activityType: .course, mediaType: .audio, minDuration: 10, maxDuation: 20, isFavorite: true)

            ]
        
        return ActivityList(activities: list, title: title ?? "Favorite", bannerText: "Find all your favorite meditations and exercises here.")
        
    }
}
