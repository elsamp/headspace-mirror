//
//  ActivityDataServiceProtocol.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-14.
//

import Foundation

enum ActivityListUseCase {
    case recent
    case favorite
    case dailySuggestedMorning
    case dailySuggestedAfternoon
    case dailySuggestedEvening
}

protocol ActivityDataServiceProtocol {
    func fetchActivityList(for useCase: ActivityListUseCase) -> ActivityList
}
