//
//  PinkThemeBGView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-06.
//

import SwiftUI

struct TriangleBGView: View {
    
    let palette: ColorPalette
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(palette.backgroundColor)
            
            //Left Small Triangle
            Triangle()
                .fill(palette.darkSecondaryColor)
                .stroke(palette.darkSecondaryColor, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width:20, height:20)
                .rotationEffect(.degrees(90))
                .offset(x: -65, y: -15)
            
            //Top Right Triangle
            Triangle()
                .fill(palette.lightSecondaryColor)
                .stroke(palette.lightSecondaryColor, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .frame(width:45, height:40)
                .rotationEffect(.degrees(220))
                .offset(x: 60, y: -30)
            
            //Bottom Left Triangle
            Triangle()
                .fill(palette.lightSecondaryColor)
                .stroke(palette.lightSecondaryColor, style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                .frame(width:45, height:40)
                .rotationEffect(.degrees(200))
                .offset(x: -30, y: 65)
                
            
        }
        .mask {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
        }
        
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        VStack {
            TriangleBGView(palette: ColorPaletteManager.shared.colorPalette(for: .pink))
        }
        .frame(width: 190, height: 80)
    }
    
}


