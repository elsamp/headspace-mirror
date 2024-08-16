//
//  activityListRowItem.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ActivityListRowItem: View {
    
    let activity: Activity
    
    var body: some View {
        
        HStack {
            //Replace with Image
            Rectangle()
                .containerRelativeFrame(.horizontal, count: 6, span: 1, spacing: 0)
                .frame(height: 50)
                .foregroundColor(.white)
                .opacity(0.2)
                .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 5,
                                                                   bottomLeading: 5,
                                                                   bottomTrailing: 5,
                                                                   topTrailing: 5)))
            
            VStack(alignment: .leading) {
                activityTitle()
                ActivityHorizontalMetadataView(activity: activity)
            }
            .padding(.leading, 10)
        }
            
    }
    
    func activityTitle() -> some View {
        HStack {
            if activity.isFavorite{
                Image(systemName: "heart.fill")
                    .foregroundStyle(.favoriteHeart)
                    .font(.headline)
            }
            Text(activity.title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                
            Spacer()
        }
        .padding(.bottom, 5)
    }

}

#Preview {
    ZStack {
        Color.mainBackground
        List{
            ActivityListRowItem(activity: PreviewHelper.shared.exampleActivity())
                .listRowBackground(Color.mainBackground)
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity)
        .background(.mainBackground)
        .scrollContentBackground(.hidden)
    }
}
