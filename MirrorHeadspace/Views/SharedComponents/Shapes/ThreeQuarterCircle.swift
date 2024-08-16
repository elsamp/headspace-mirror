//
//  QuarterCircle.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ThreeQuarterCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX ,y:rect.midY ))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.width / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 270),
                        clockwise: false)
            path.addLine(to: CGPoint(x: rect.midX ,y:rect.midY ))
        }
    }
    
    
}

#Preview {
    ZStack {
        Color.mainBackground
        ThreeQuarterCircle()
            .frame(width: 200, height: 100)
            .foregroundStyle(.mint)
    }
}
