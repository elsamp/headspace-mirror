//
//  MainView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct MainView: View {
    
    let viewModel: MainViewModel
    
    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel(dataService: viewModel.activityDataService))
                .tabItem {
                    Label("Today", systemImage: "house.fill")
                }
                .toolbarBackground(.mainBackground, for: .tabBar)
            
            ExploreView(viewModel: ExploreViewModel(dataService: viewModel.focusAreaDataService))
                .tabItem {
                    Label("Explore", systemImage: "square.split.2x2.fill")
                }
            
            ProfileView(viewModel: ProfileViewModel(dataService: viewModel.activityDataService, user: viewModel.activeUser))
                .tabItem {
                    Label(viewModel.userFirstName, systemImage: "person")
                }
                
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView(viewModel: MainViewModel(userDataService: PreviewHelper.shared,
                                      activityDataService: PreviewHelper.shared,
                                      focusAreaDataService: PreviewHelper.shared))
}
