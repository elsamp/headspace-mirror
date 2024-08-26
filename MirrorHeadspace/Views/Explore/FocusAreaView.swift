//
//  FocusAreaView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct FocusAreaView: View {
    
    var focusArea: FocusArea
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                VStack(alignment: .leading) {

                    //TODO: Recent/Reccomended Tab View
                    
                    //Collection List
                    Text("Explore \(focusArea.title)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    ActivityCollectionCardStackView(collections: focusArea.collections)
                    
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.mainBackground)
        .toolbarBackground(.mainBackground, for: .navigationBar)
    }
    
    private var headerView: some View {
        ZStack {
            ImageHeaderView {
                //TODO: Replace with graphic
                Rectangle()
                    .frame(height: 250)
                    .foregroundStyle(.mainAccent)
            } titleContent: {
                FocusAreaHeaderTitleView(activity: focusArea.featuredActivity)
            }
        }
    }
}

#Preview {
    FocusAreaView(focusArea: PreviewHelper.shared.exampleFocusArea(title: "Sleep", colorTheme: .purple))
}
