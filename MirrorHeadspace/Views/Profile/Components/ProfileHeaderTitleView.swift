//
//  ProfileHeaderTitleView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ProfileHeaderTitleView: View {

    let name: String
    let joinDate: Date
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Group {
                Text("Joined in ") +
                Text(joinDate, format: .dateTime.year())
            }
                .font(.subheadline)
                .foregroundStyle(.mainAccent)
        }
        
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ProfileHeaderTitleView(name: "Erica Sampson", joinDate: Date.now)
    }
}
