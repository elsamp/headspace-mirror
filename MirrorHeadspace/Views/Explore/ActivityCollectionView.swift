//
//  ActivityCollectionView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct ActivityCollectionView: View {
    
    let collection: ActivityCollection
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                //Description Text
                Text(collection.description)
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundStyle(.mainAccent)
                    .padding(.vertical, 10)
                    .padding(.bottom, 5)
                
                //Featured Lists Swipe View
                if let activityLists = collection.featuredLists {
                    ForEach(activityLists) { list in
                        FeaturedActivityListTabView(activityList: list)
                            .containerRelativeFrame(.vertical, count: 8, span: 3, spacing: 0)
                            .padding(.bottom, 20)

                    }
                }
                
                //Activity List Grids
                ForEach(collection.activityLists) { list in
                    ActivityGridView(activityList: list)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.mainBackground)
        .toolbarBackground(.mainBackground, for: .navigationBar)
    }
}

#Preview {
    ActivityCollectionView(collection: PreviewHelper.shared.exampleCollection())
}
