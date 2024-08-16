//
//  ActivityHorizontalMetadataView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-30.
//

import SwiftUI

struct ActivityHorizontalMetadataView: View {
    
    let activity: Activity
    
    //TODO: support modifiers instead
    let font: Font
    let foregroundColor: Color
    
    init(activity: Activity, font: Font = .caption, foregroundColor: Color = .mainAccent) {
        self.activity = activity
        self.font = font
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        HStack {
            Image(systemName: (activity.mediaType == .video) ? "play.rectangle" : "speaker.wave.2")
                .foregroundStyle(foregroundColor)
                .font(font)
            
            Text(activity.activityType.rawValue)
                .foregroundStyle(foregroundColor)
                .font(font)
            
            Text("• " + (activity.minDuration != nil ? String(activity.minDuration!) + "-" : "") + "\(activity.maxDuation) min")
                .foregroundStyle(foregroundColor)
                .font(font)
        }
    }
}

#Preview {
    ZStack {
        Color(.mainBackground)
        ActivityHorizontalMetadataView(activity: PreviewHelper.shared.exampleActivity())
    }
}
