//
//  Semicircle.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct Semicircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX ,y:rect.minY ))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: rect.width/2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
        }
    }
    
    
}

#Preview {
    ZStack {
        Color.mainBackground
        Semicircle()
            .frame(width: 200, height: 100)
            .foregroundStyle(.mint)
    }
}
