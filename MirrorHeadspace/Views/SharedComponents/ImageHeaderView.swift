//
//  ImageHeaderView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ImageHeaderView<ImageContent: View, TitleContent:View>: View {
    
    let imageContent: ImageContent
    let titleContent: TitleContent
    
    init(@ViewBuilder imageContent: () -> ImageContent ,@ViewBuilder titleContent: () -> TitleContent) {
        self.imageContent = imageContent()
        self.titleContent = titleContent()
    }
    
    var body: some View {
        VStack {
            imageContent
                .mask {
                    HeaderViewImageMask()
                }
            titleContent
        }
    }
}

#Preview {
    ZStack {
        
        Color.mainBackground
        
        ImageHeaderView {
            Rectangle()
                .fill(.mint)
                .frame(height: 250)
        } titleContent: {
            ProfileHeaderTitleView(name: "Erica Sampson", joinDate: Date.now)
        }
    }
    .ignoresSafeArea()
}
