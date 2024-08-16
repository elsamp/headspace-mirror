//
//  MirrorHeadspaceApp.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

@main
struct MirrorHeadspaceApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(userDataService: MockDataService(),
                                              activityDataService: MockDataService(),
                                              focusAreaDataService: MockDataService()))
        }
    }
}
