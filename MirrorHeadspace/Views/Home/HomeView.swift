//
//  ContentView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct HomeView: View {
    
    let viewModel: HomeViewModel
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    
                    Text("Good afternoon, Mark")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                    
                    //Morning
                    ActivityCardStackView(activities: viewModel.morningActivities, listTitle: "Start your day")
                    
                    //Afternoon
                    ActivityCardStackView(activities: viewModel.afternoonActivities, listTitle: "Your afternoon lift")
                    
                    //Evening
                    ActivityCardStackView(activities: viewModel.eveningActivities, listTitle: "At night")
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(.mainBackground)
            .toolbar {
                ToolbarItem{
                    NavigationLink(value: viewModel.favoriteActivities()) {
                        Image(systemName: "heart")
                    }
                }
                ToolbarItem{
                    NavigationLink(value: viewModel.recentActivities()) {
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
    HomeView(viewModel: HomeViewModel(dataService: PreviewHelper.shared))
}
