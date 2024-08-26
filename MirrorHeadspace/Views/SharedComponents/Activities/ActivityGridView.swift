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
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .topLeading), GridItem(.flexible(), spacing: 20)], spacing: 15) {
                ForEach(activityList.activities) { activity in
                    ActivityGridItemView(activity: activity)
                }
            }
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
