//
//  SparkleDiamond.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-08.
//

import SwiftUI

struct SparkleDiamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            // top point
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
            //right point
            path.addCurve(to: CGPoint(x: rect.maxX, y:rect.midY),
                          control1: CGPoint(x: rect.midX, y:rect.midY/2),
                          control2: CGPoint(x: rect.midX * 1.5, y:rect.midY))
            
            //bottom point
            path.addCurve(to: CGPoint(x: rect.midX, y:rect.maxY),
                          control1: CGPoint(x: rect.midX * 1.5, y:rect.midY),
                          control2: CGPoint(x: rect.midX, y:rect.midY * 1.5))
            
            //left point
            path.addCurve(to: CGPoint(x: rect.minX, y:rect.midY),
                          control1: CGPoint(x: rect.midX, y:rect.midY * 1.5),
                          control2: CGPoint(x: rect.midX / 2, y:rect.midY))
            
            
            //top point
            path.addCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control1: CGPoint(x: rect.midX / 2, y:rect.midY),
                          control2: CGPoint(x: rect.midX, y:rect.midY/2))

        }
    }
}

#Preview {
    
    VStack {
        SparkleDiamond()
            .frame(width: 100, height: 100)
        
        SparkleDiamond()
            .frame(width: 100, height: 200)
        
        SparkleDiamond()
            .frame(width: 200, height: 100)
    }
    
    
}
