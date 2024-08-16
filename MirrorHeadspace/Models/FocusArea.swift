//
//  FocusArea.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-30.
//

import Foundation

struct FocusArea: Identifiable, Decodable, Hashable {

    enum CodingKeys: CodingKey {
        case id
        case title
        case colorTheme
        case featuredActivity
        case recentActivities
        case recommendedActivities
        case dailyActivity
        case collections
    }
    
    let id: String
    let title: String
    let colorTheme: ColorTheme
    let featuredActivity: Activity
    let recentActivities: [Activity]?
    let recommendedActivities: [Activity]
    let dailyActivity: Activity?
    let collections: [ActivityCollection]
    
    
    init(id: String = UUID().uuidString, title: String, colorTheme: ColorTheme, featuredActivity: Activity, recentActivities: [Activity]?, recommendedActivities: [Activity], dailyActivity: Activity?, collections: [ActivityCollection]) {
        self.id = id
        self.title = title
        self.colorTheme = colorTheme
        self.featuredActivity = featuredActivity
        self.recentActivities = recentActivities
        self.recommendedActivities = recommendedActivities
        self.dailyActivity = dailyActivity
        self.collections = collections
        
    }
    
    static func == (lhs: FocusArea, rhs: FocusArea) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
