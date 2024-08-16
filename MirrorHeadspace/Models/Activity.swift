//
//  Activity.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import Foundation

enum ActivityType: String, Codable {
    case mindfulActivity = "Mindful Activity"
    case wakeUp = "The Wake Up"
    case dailyMeditation = "Today's Meditation"
    case course = "Course"
    case workout = "Workout"
    case sleepcase = "Sleepcast"
    case meditation = "Meditation"
    case sleepMusic = "Sleep Music"
    case focusMusic = "Focus Music"
    case windDown = "Wind Down"
    case video = "Video"
    case soundscape = "Soundscape"
}

enum MediaType: String, Codable {
    case audio
    case video
}

enum ActivityStatus: String, Codable {
    case suggested
    case active
    case complete
}

class Activity: Identifiable, Hashable, Decodable {

    enum CodingKeys: CodingKey {
        case id
        case title
        case description
        case activityType
        case mediaType
        case minDuration
        case maxDuration
        case status
        case isFavorite
    }
    
    let id: String
    let title: String
    let description: String
    let activityType: ActivityType
    let mediaType: MediaType
    let minDuration: Int?
    let maxDuation: Int
    let status: ActivityStatus
    let isFavorite: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, activityType: ActivityType, mediaType: MediaType, minDuration: Int? = nil, maxDuation: Int, status: ActivityStatus = .suggested, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.activityType = activityType
        self.mediaType = mediaType
        self.minDuration = minDuration
        self.maxDuation = maxDuation
        self.status = status
        self.isFavorite = isFavorite
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        activityType = try container.decode(ActivityType.self, forKey: .activityType)
        mediaType = try container.decode(MediaType.self, forKey: .mediaType)
        minDuration = try? container.decode(Int.self, forKey: .minDuration)
        maxDuation = try container.decode(Int.self, forKey: .maxDuration)
        status = try container.decode(ActivityStatus.self, forKey: .status)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
