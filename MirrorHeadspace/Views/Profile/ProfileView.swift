//
//  ProfileView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ProfileView: View {
    
    let viewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack {
                        
                        headerView
                        VStack(alignment: .leading) {
                            
                            //Stats
                            ProfileStatsView(totalMeditationMinutes: viewModel.userTotalMeditationMinutes,
                                             averageSessionMinutes: viewModel.averageSessionMinutes,
                                             numberOfSessions: viewModel.userSessionCount)
  
                            //Activity History
                            ActivitySummaryListView(activityList: viewModel.recentActivities)
                                .padding(.top, 30)
                            
                            //Headspace Guest Pass
                            Text("Headspace 30-Day Guest Pass")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top, 30)
                            
                            GuestPassCardView()
                            
                        }
                        .padding() //padding should not effect header or footer
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.mainBackground)
                .edgesIgnoringSafeArea(.top)
                
                settingsButton
                    .padding(.horizontal, 15)
                
            }
        }
        .toolbarBackground(.mainBackground, for: .tabBar)
        
    }
    
    private var headerView: some View {
        ZStack {
            ImageHeaderView {
                //TODO: Replace with graphic
                Rectangle()
                    .frame(height: 150)
                    .foregroundStyle(.mainAccent)
                    
            } titleContent: {
                ProfileHeaderTitleView(name: viewModel.userName, joinDate: viewModel.userJoinDate)
            }
            
            ProfileIconView()
                .scaleEffect(0.9)
        }
    }
    
    private var settingsButton: some View {
        
        Button {
            //TODO: open settings
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 49)
                Image(systemName: "gear")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(5)
                    .background(.black)
                    .clipShape(.circle)
                
            }
        }
        
    }
    
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(dataService: PreviewHelper.shared, user: PreviewHelper.shared.getActiveUser()))
}
