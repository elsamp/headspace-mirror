//
//  HourglassIconView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct HourglassIconView: View {
    
    let stroke = StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)
    let glassColor = Color(red: 1, green: 0.7, blue: 0.8)
    
    var body: some View {
        
        ZStack {
            Semicircle()
                .stroke(glassColor, style: stroke)
                .fill(glassColor)
            Semicircle().rotation(Angle(degrees: 180))
                .stroke(glassColor, style: stroke)
                .fill(glassColor)
        }
        .frame(width: 20, height: 22)
        
    }
}

#Preview {
    HourglassIconView()
}
