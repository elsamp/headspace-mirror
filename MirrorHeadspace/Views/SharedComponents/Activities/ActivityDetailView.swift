//
//  ActivityDetailPage.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-30.
//

import SwiftUI

struct ActivityDetailView: View {
    
    let activity: Activity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Rectangle()
                    .containerRelativeFrame(.vertical, count: 3, spacing: 0)
                    .foregroundColor(.white)
                    .opacity(0.2)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10,
                                                                       bottomLeading: 10,
                                                                       bottomTrailing: 10,
                                                                       topTrailing: 10)))
                VStack(alignment: .leading) {
                    HStack {

                        Text(activity.title)
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button {
                            //Functionality to favorite items
                        } label: {
                            Image(systemName: activity.isFavorite ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(activity.isFavorite ? .favoriteHeart : .white)
                        }
                        .padding(10)
                        .offset(y: 3)
                        
                        Button {
                            //Functionality to share items
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                        
                    }
                    
                    ActivityHorizontalMetadataView(activity: activity)
                    
                    Text(activity.description)
                        .foregroundStyle(.mainAccent)
                        .padding(.top, 20)
                    
                }
                .padding()
            }
        }
        .background(.mainBackground)
    }
}

#Preview {
    ActivityDetailView(activity: PreviewHelper.shared.exampleActivity())
}
