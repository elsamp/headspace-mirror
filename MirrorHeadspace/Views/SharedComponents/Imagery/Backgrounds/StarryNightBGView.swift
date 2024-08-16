//
//  PurpleThemeBGView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-05.
//

import SwiftUI

struct StarryNightBGView: View {
    
    let palette: ColorPalette
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(palette.backgroundColor)
            
            //Top left circle
            Circle()
                .fill(palette.lightSecondaryColor)
                .scaleEffect(0.15)
                .offset(x: -75, y: -15)
            
            //Bottom right circle
            Circle()
                .fill(palette.lightSecondaryColor)
                .scaleEffect(0.1)
                .offset(x: 50, y: 20)
            
            //Bottom left circle
            Circle()
                .fill(palette.darkSecondaryColor)
                .scaleEffect(0.8)
                .offset(x: -70, y: 50)
            
            //Top right sparkle
            SparkleDiamond()
                .fill(.white)
                .frame(width: 28, height: 28)
                .offset(x: 70, y:-20)
                .opacity(0.2)

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
            StarryNightBGView(palette: ColorPaletteManager.shared.colorPalette(for: .purple))
        }
        .frame(width: 190, height: 80)
    }
}


