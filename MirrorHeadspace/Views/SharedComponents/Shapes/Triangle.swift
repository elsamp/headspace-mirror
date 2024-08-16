//
//  Triangle.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-08.
//

import SwiftUI

struct Triangle:Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
           
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
        }
    }
}

#Preview {
    
    VStack {
        Triangle()
    }
    .frame(width: 200, height: 200)
    
}
