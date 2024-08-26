//
//  GuestPassCardView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-12.
//

import SwiftUI

struct GuestPassCardView: View {
    
    private let darkGray = Color(red: 0.35, green: 0.35, blue: 0.35)
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(.yellow)
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                
                VStack(alignment: .leading) {
                    Text("Send free access to new members")
                        .font(.subheadline)
                        .foregroundStyle(darkGray)
                        .padding(.bottom, 1)
                    
                    Text("Bring a friend along the journey")
                        .font(.headline)
                        .foregroundStyle(darkGray)
                }
                .padding(25)
            }
            
            friendImageView
        }
        //.frame(height: 220)
        .clipShape(.rect(cornerRadius: 20))
        
    }
    
    private var friendImageView: some View {
        VStack {
            ZStack {
                SparkleDiamond()
                    .stroke(.white, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .fill(.white)
                    .frame(width: 25, height: 25)
                
                SparkleDiamond()
                    .stroke(.white, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .fill(.white)
                    .frame(width: 8, height: 8)
                    .offset(CGSize(width: -25, height: 15))
                
                friend2View
                    .offset(CGSize(width: 100, height: 60))
                
                friend1View
                    .offset(CGSize(width: -110, height: 80))
            }
        }
        
    }
    
    private var friend1View: some View {
        ZStack {
            Semicircle()
                .rotation(Angle(degrees: 180))
                .fill(.blue)
                .frame(width: 270)
            
            faceView
                .offset(x: 20, y: -40)
        }
        .rotationEffect(Angle(degrees: 10))
        .frame(height: 135)
    }
    
    private var friend2View: some View {
        ZStack {
            Semicircle()
                .rotation(Angle(degrees: 200))
                .fill(.orange)
                .frame(width: 270)
            
            faceView
                .offset(CGSize(width: -30, height: -40))
            
            Semicircle()
                .rotation(Angle(degrees: 250))
                .fill(.orangeMain)
                .frame(width: 270)
                .offset(x: -160, y: 5)
                .mask({
                    Semicircle()
                        .rotation(Angle(degrees: 200))
                        .frame(width: 270)
                })
        }
        .frame(height: 135)
        .rotationEffect(Angle(degrees: -20))
    }
    
    @ViewBuilder private var faceView: some View {
        eyeView
            .offset(CGSize(width: -10, height: 0))
        eyeView
            .offset(CGSize(width: 10, height: 0))
        smileView
    }
    
    private var smileView: some View {
        GeometryReader { geometry in
            Path { path in
                path.addArc(center: CGPoint(x: geometry.frame(in: .local).midX,
                                            y:geometry.frame(in: .local).midY - 40),
                            radius: 60,
                            startAngle: Angle(degrees: 130),
                            endAngle: Angle(degrees: 50),
                            clockwise: true)
            }
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round))
        }
    }
    
    private var eyeView: some View {
        GeometryReader { geometry in
            Path { path in
                path.addArc(center: CGPoint(x: geometry.frame(in: .local).midX,
                                            y:geometry.frame(in: .local).midY),
                            radius: 7,
                            startAngle: Angle(degrees: 170),
                            endAngle: Angle(degrees: 10),
                            clockwise: true)
            }
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round))
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        GuestPassCardView()
            .padding()
    }
}
