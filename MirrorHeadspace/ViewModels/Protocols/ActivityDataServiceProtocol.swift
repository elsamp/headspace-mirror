//
//  ActivityDataServiceProtocol.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-14.
//

import Foundation

protocol ActivityDataServiceProtocol {
    func getMorningActivities() -> [Activity]
    func getAfternoonActivities() -> [Activity]
    func getEveningActivities() -> [Activity]
    func getRecentActivities(title: String?) -> ActivityList
    func getFavoriteActivities(title: String?) -> ActivityList
}
