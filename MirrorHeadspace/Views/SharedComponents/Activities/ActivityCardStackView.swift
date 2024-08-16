//
//  TitledCardStack.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

extension HorizontalAlignment {
    struct CardStackTitleAndStatusIndicator: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.leading]
        }
    }
    
    static let cardStackTitleAndStatusIndicator = HorizontalAlignment(CardStackTitleAndStatusIndicator.self)
}

struct ActivityCardStackView: View {
    
    let activities: [Activity]
    let listTitle: String?
    
    @State private var positions: [String: CGPoint] = [:]
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .cardStackTitleAndStatusIndicator) {
                
                if let title = listTitle {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .alignmentGuide(.cardStackTitleAndStatusIndicator) { d in
                            d[.leading]
                        }
                }
                
                ZStack {
                    
                    //Dashed line between activity status indicators
                    Path { path in
                        
                        if let position = positions[activities[0].id] {
                            path.move(to: position)
                        }

                        for activity in activities {
                            if let position = positions[activity.id] {
                                path.addLine(to: position)
                            }
                        }
                    }
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5, 7]))
                    .fill(.mainAccent)
                    .opacity(0.6)
                    
                    //Activity Cards
                    VStack {
                        ForEach(activities) { activity in
                            NavigationLink(value: activity) {
                                ActivityCardView(activity: activity)
                                    .alignmentGuide(.cardStackTitleAndStatusIndicator) { d in
                                        d[.leading]
                                    }
                            }
                            .padding(.vertical, 8)
                            
                        }
                    }
                }
                .coordinateSpace(name: "cardStack")
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 15)
            .onPreferenceChange(NodePositionKey.self) { newPositions in
                positions = newPositions
            }

        }
    }
    
    func connectDots(points: [CGPoint]) -> some View{
        Path { path in
            path.move(to: points[0])
            
            for i in 0..<points.count {
                path.addLine(to: points[i])
            }
        }
        .stroke(.white, style: StrokeStyle(lineWidth: 3))
    }
}

#Preview {
    ZStack {
        Color(.mainBackground)
        ScrollView {
            VStack {
                ActivityCardStackView(activities: PreviewHelper.shared.exampleActivityArray(), listTitle: "Start your day")
            }
        }
    }
}
