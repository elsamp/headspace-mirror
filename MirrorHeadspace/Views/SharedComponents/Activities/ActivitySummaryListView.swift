//
//  ActivitySummaryListView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-12.
//

import SwiftUI

struct ActivitySummaryListView: View {
    
    var activityList: ActivityList
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(activityList.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            ForEach(0..<3) { index in
                ActivityListRowItemView(activity: activityList.activities[index])
                    .padding(.vertical, 10)
            }
            
            Button("View full history") {
                //Show full list
            }
            .frame(maxWidth: .infinity)
            .padding(14)
            .background(.blue)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ActivitySummaryListView(activityList: PreviewHelper.shared.exampleRecentActivityList())
    }
   
}
