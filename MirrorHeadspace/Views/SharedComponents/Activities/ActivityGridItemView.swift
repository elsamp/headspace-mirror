//
//  ActivityGridItemView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-26.
//

import SwiftUI

struct ActivityGridItemView: View {
    
    var activity: Activity
    
    var body: some View {
        NavigationLink(value: activity) {
            VStack(alignment: .leading, spacing: 5) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.mainAccent)
                    .containerRelativeFrame(.vertical, count: 7, spacing: 0)
                    .opacity(0.6)
                Text(activity.title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 5)
                ActivityHorizontalMetadataView(activity: activity, font: .caption2)
                Text(activity.description)
                    .foregroundStyle(.mainAccent)
                    .multilineTextAlignment(.leading)
                    .font(.caption2)
                Spacer()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ActivityGridItemView(activity: PreviewHelper.shared.exampleActivity())
    }
}
