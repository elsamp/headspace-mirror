//
//  MeditateBGImageView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-01.
//

import SwiftUI

struct SunshineBGView: View {
    
    let palette: ColorPalette
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(palette.backgroundColor)
            Circle()
                .fill(palette.darkSecondaryColor)
                .scaleEffect(3.5)
                .offset(x: 0, y: 105)
            Circle()
                .fill(palette.lightSecondaryColor)
                .scaleEffect(2.3)
                .offset(x: 0, y: 110)
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
            SunshineBGView(palette: ColorPaletteManager.shared.colorPalette(for: .orange))
        }
        .frame(width: 190, height: 80)
    }
}


