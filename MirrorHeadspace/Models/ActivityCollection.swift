//
//  ActivityTheme.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-30.
//

import Foundation

struct ActivityCollection: Identifiable, Decodable, Hashable {
    
    let id: String
    let title: String
    let description: String
    
    let featuredLists: [ActivityList]?
    let activityLists: [ActivityList]

    init(id: String = UUID().uuidString, title: String, description: String, featuredLists: [ActivityList]?, activityLists: [ActivityList]) {
        self.id = id
        self.title = title
        self.description = description
        self.featuredLists = featuredLists
        self.activityLists = activityLists
    }
    
    static func == (lhs: ActivityCollection, rhs: ActivityCollection) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
