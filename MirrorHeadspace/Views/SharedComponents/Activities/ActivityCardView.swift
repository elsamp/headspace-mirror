//
//  ActivityCardView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ActivityCardView: View {
    
    let activity: Activity
    
    var body: some View {
        
        HStack(alignment: .center) {
            
 
            GeometryReader { geometry in

                ActivityStatusIndicatorView(status: activity.status)
                    
                    .preference(key: NodePositionKey.self,
                                value: [activity.id: CGPoint(x: geometry.frame(in: .named("cardStack")).midX,
                                                             y: geometry.frame(in: .named("cardStack")).midY)])

            }
            .frame(width: 15, height: 15)
            .padding(.trailing, 10)
            
            ZStack {
                
                cardBackground()
                
                HStack {
                    VStack(alignment: .leading) {
                        activityTitle()
                            .fixedSize(horizontal: false, vertical: true)
                        activityType()
                        activityDuration()
                        activityMenuButton()
                    }
                    
                    //Replace with Image
                    Rectangle()
                        .containerRelativeFrame(.horizontal, count: 11, span: 3, spacing: 0)
                        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10,
                                                                           bottomLeading: 10,
                                                                           bottomTrailing: 10,
                                                                           topTrailing: 10)))
                        .opacity(0.2)
                        .padding(.leading, 10)
                        .padding(.vertical, 10)
                }
            }
            .containerRelativeFrame(.horizontal, count: 12, span: 10, spacing: 0)
        }
        .multilineTextAlignment(.leading)
    }
    
    func cardBackground() -> some View {
        Color.white
            .opacity(0.2)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 15,
                                                               bottomLeading: 15,
                                                               bottomTrailing: 15,
                                                               topTrailing: 15)))
    }
    
    func activityTitle() -> some View {
        Text(activity.title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .containerRelativeFrame(.horizontal, count: 7, span: 3, spacing: 0, alignment: .leading)
            .padding(.vertical, 4)
            .padding(.top, 8)
    }
    
    func activityType() -> some View {
        HStack {
            Image(systemName: (activity.mediaType == .video) ? "play.rectangle" : "speaker.wave.2")
                .foregroundStyle(.white)
                .font(.caption)
                .opacity(0.4)
            
            Text(activity.activityType.rawValue)
                .foregroundStyle(.white)
                .opacity(0.4)
                .font(.caption)
        }
    }
    
    func activityDuration() -> some View {
        Text((activity.minDuration != nil ? String(activity.minDuration!) + "-" : "") + "\(activity.maxDuation) min")
            .foregroundStyle(.white)
            .opacity(0.4)
            .font(.caption)
    }
       
    func activityMenuButton() -> some View {
        Button {
            //TODO: open menu
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(.white)
                .font(.subheadline)
        }
        .frame(width: 30, height: 30)
        .background(.mainBackground)
        .clipShape(Circle())
        .padding(.bottom, 10)
    }
}

#Preview {
    ZStack {
        ScrollView {
            VStack {
                Color(.mainBackground)
                ActivityCardView(activity: PreviewHelper.shared.exampleActivity())
            }
        }
        .background(.mainBackground)
    }
}
