//
//  ActivityGridView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct ActivityGridView: View {
    
    var activityList: ActivityList
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(activityList.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20)], spacing: 15) {
                ForEach(activityList.activities) { activity in
                    activityGridItem(for: activity)
                }
            }
        }
    }
    
    func activityGridItem(for activity: Activity) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            RoundedRectangle(cornerRadius: 15)
                .fill(.mainAccent)
                .containerRelativeFrame(.vertical, count: 7, spacing: 0)
                .opacity(0.6)
            Text(activity.title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.top, 5)
            ActivityHorizontalMetadataView(activity: activity, font: .caption2)
            Text(activity.description)
                .foregroundStyle(.mainAccent)
                .font(.caption2)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ActivityGridView(activityList: PreviewHelper.shared.exampleActivityList())
            .padding(20)
    }
    
}
