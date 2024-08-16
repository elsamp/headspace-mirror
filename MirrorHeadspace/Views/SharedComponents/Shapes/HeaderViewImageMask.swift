//
//  HeaderViewImageMask.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct HeaderViewImageMask: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addCurve(to: CGPoint(x: rect.minX, y:rect.maxY),
                          control1: CGPoint(x: rect.midX + (rect.width / 5), y: rect.maxY - 40),
                          control2: CGPoint(x: rect.midX - (rect.width / 5), y: rect.maxY - 40))
        }
    }
}

#Preview {
    ZStack {
        HeaderViewImageMask()
            .frame(height: 400)
    }
}
