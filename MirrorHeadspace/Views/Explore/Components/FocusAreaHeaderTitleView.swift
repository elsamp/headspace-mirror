//
//  FocusAreaHeaderTitleView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct FocusAreaHeaderTitleView: View {

    let activity: Activity
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            
            reccomendedPill
            Text(activity.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
            
            ActivityHorizontalMetadataView(activity: activity)
            ctaButton
        }
        
    }
    
    private var reccomendedPill: some View {
        Text("Recommended")
            .foregroundStyle(.mainAccent)
            .font(.caption)
            .padding(1)
            .padding(.horizontal, 3)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.mainAccent)
                    .opacity(0.5)
            )
    }
    
    private var ctaButton: some View {
        Button() {
            
        } label: {
            HStack {
                Image(systemName: "play.fill")
                Text("Play")
            }
            .foregroundStyle(.white)
        }
        .padding(10)
        .padding(.horizontal)
        .background(.blue)
        .clipShape(.capsule)
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        FocusAreaHeaderTitleView(activity: PreviewHelper.shared.exampleActivity())
    }
}
