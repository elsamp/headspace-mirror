//
//  ActivityList.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-30.
//

import Foundation

struct ActivityList: Hashable, Decodable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case activities
        case bannerText
    }
    
    let id : String
    let activities: [Activity]
    let title: String
    let bannerText: String?
    
    init(id: String = UUID().uuidString, activities: [Activity], title: String, bannerText: String? = nil) {
        self.activities = activities
        self.title = title
        self.bannerText = bannerText
        self.id = id
    }
}
