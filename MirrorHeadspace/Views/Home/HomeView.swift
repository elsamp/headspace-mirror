//
//  ContentView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct HomeView: View {
    
    let viewModel: HomeViewModel
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    
                    Text("Good afternoon, \(user.firstName)")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                    
                    //Morning
                    ActivityCardStackView(activityList: viewModel.getActivityList(for: .dailySuggestedMorning))
                    
                    //Afternoon
                    ActivityCardStackView(activityList: viewModel.getActivityList(for: .dailySuggestedAfternoon))
                    
                    //Evening
                    ActivityCardStackView(activityList: viewModel.getActivityList(for: .dailySuggestedEvening))
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(.mainBackground)
            .toolbar {
                ToolbarItem{
                    NavigationLink(value: viewModel.getActivityList(for: .favorite)) {
                        Image(systemName: "heart")
                    }
                }
                ToolbarItem{
                    NavigationLink(value: viewModel.getActivityList(for: .recent)) {
                        Image(systemName: "clock")
                    }
                }
            }
            .toolbarBackground(.mainBackground, for: .navigationBar)
            .navigationDestination(for: ActivityList.self) { list in
                ActivityListView(activityList: list)
            }
            .navigationDestination(for: Activity.self) { activity in
                ActivityDetailView(activity: activity)
                    
            }
            
        }
        .accentColor(.white)
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(dataService: PreviewHelper.shared), user: PreviewHelper.shared.getActiveUser())
}
