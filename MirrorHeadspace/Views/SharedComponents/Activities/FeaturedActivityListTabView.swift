//
//  FeaturedActivityListTabView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct FeaturedActivityListTabView: View {
    
    let activityList: ActivityList
    @State private var scrollIndex: Int?
    
    var body: some View {
        
        VStack(alignment: .leading) {

            Text(activityList.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<activityList.activities.count, id: \.self) { index in
                            NavigationLink(value: activityList.activities[index]) {
                                FeaturedActivityCardView(activity: activityList.activities[index])
                                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .scrollPosition(id: $scrollIndex)
                
                pageIndicatorView(at: scrollIndex ?? 0, totalPages: activityList.activities.count)
            }
        }
    }
    
    func pageIndicatorView(at index: Int, totalPages: Int) -> some View {
        ZStack {
            HStack {
                ForEach(0..<totalPages, id: \.self) { i in
                    Circle()
                        .fill(i == index ? .white : .gray)
                        .frame(width: 7)
                        .padding(2)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        FeaturedActivityListTabView(activityList: PreviewHelper.shared.exampleActivityList())
    }
}
