//
//  ClockIconView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ClockIconView: View {
    
    var clockColor = Color(red: 0.2, green: 0.4, blue: 1)
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
            ThreeQuarterCircle()
                .fill(clockColor)
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ClockIconView()
    }
}
