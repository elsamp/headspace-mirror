//
//  ProfileIconView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ProfileIconView: View {
    let stroke = StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
    let skinColor = Color(red: 1, green: 0.8, blue: 0.9)
    let smileColor = Color(red: 1, green: 0.6, blue: 0.7)
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(Color(red: 0.1, green: 0.1, blue: 0.3), lineWidth: 4)
                .fill(.mainBackground)
                .frame(width: 95, height: 95)
            
            ZStack() {
                Circle()
                    .fill(.green)
                    .frame(width: 80, height: 80)
                    
                face
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: -20))
                    .offset(x: 4,y: 12)
            }
            .mask {
                Circle()
                    .frame(width: 80, height: 80)
            }
        }
        
    }
    
    @ViewBuilder var face: some View {
        Semicircle().rotation(Angle(degrees: 180))
            .stroke(skinColor, style: stroke)
            .fill(skinColor)
        ZStack {
            Semicircle()
                .stroke(skinColor, style: stroke)
                .fill(skinColor)
            smile
            eyes
        }
        
    }
    
    var smile: some View {
        Path { path in
            path.addArc(center: CGPoint(x: 25, y:-10),
                        radius: 25,
                        startAngle: Angle(degrees: 130),
                        endAngle: Angle(degrees: 50),
                        clockwise: true)
        }
        .stroke(smileColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
    }
    
    @ViewBuilder var eyes: some View {
        Path { path in
            path.addArc(center: CGPoint(x: 18, y:3),
                        radius: 5,
                        startAngle: Angle(degrees: 160),
                        endAngle: Angle(degrees: 20),
                        clockwise: true)
        }
        .stroke(smileColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
        
        Path { path in
            path.addArc(center: CGPoint(x: 32, y:3),
                        radius: 5,
                        startAngle: Angle(degrees: 160),
                        endAngle: Angle(degrees: 20),
                        clockwise: true)
        }
        .stroke(smileColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ProfileIconView()
    }
}
