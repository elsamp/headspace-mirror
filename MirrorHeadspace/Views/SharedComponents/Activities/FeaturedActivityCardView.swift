//
//  FeaturedActivityCard.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct FeaturedActivityCardView: View {
    
    let activity: Activity
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.mainAccent)
            
            VStack {
                HStack(alignment: .top) {
                    Text(activity.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding(8)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    ActivityHorizontalMetadataView(activity: activity, foregroundColor: .black)
                        .padding(8)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    FeaturedActivityCardView(activity: PreviewHelper.shared.exampleActivity())
}
