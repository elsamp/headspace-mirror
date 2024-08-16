//
//  BlueThemeBGView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-06.
//

import SwiftUI

struct CirclesBGView: View {
    
    let palette: ColorPalette
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(palette.backgroundColor)
            
            //Center background
            Circle()
                .fill(palette.darkSecondaryColor)
                .scaleEffect(1.6)
            
            //Top right shadow
            Circle()
                .fill(palette.backgroundColor)
                .scaleEffect(1.13)
                .offset(x: 80, y: -35)
            
            //Top right light
            Circle()
                .fill(palette.lightSecondaryColor)
                .scaleEffect(1.3)
                .offset(x: 70, y: -60)
            
            //Bottom left shadow
            Circle()
                .fill(palette.backgroundColor)
                .scaleEffect(1)
                .offset(x: -60, y: 60)
            
            //Bottom left light
            Circle()
                .fill(palette.lightSecondaryColor)
                .scaleEffect(1)
                .offset(x: -80, y: 50)
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
            CirclesBGView(palette: ColorPaletteManager.shared.colorPalette(for: .blue))
        }
        .frame(width: 190, height: 80)
    }
}
