//
//  FavoritesListView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ActivityListView: View {
    
    let activityList: ActivityList
    var rowItemPadding: CGFloat = 3
    
    var body: some View {
        List {
            
            if let bannerText = activityList.bannerText{
                Text(bannerText)
                    .listRowBackground(Color(red: 0.1, green: 0.1, blue: 0.3))
                    .font(.footnote)
                    .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.7))
                    .padding(.vertical, 15)
            }
           
            ForEach(activityList.activities) { activity in
                
                NavigationLink(value: activity) {
                    ActivityListRowItemView(activity: activity)
                }
                .listRowBackground(Color.mainBackground)
                .padding(.vertical, rowItemPadding)
                .listRowSeparator(.hidden)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.mainBackground)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .navigationTitle(activityList.title) //TODO: Make title appear white
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ActivityListView(activityList: PreviewHelper.shared.exampleRecentActivityList())
}
