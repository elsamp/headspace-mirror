//
//  ActivityStatusIndicatorView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ActivityStatusIndicatorView: View {
    
    let status: ActivityStatus
    
    var body: some View {
        VStack {
            switch status {
            case .suggested:
                suggestedView()
            case .active:
                activeView()
            case .complete:
                completeView()
            }
        }
    }
    
    
    func suggestedView() -> some View {
        Circle()
            .fill(.mainBackground)
            .stroke(.mainAccent, lineWidth: 2)

    }
    
    func activeView() -> some View {
        Circle()
            .fill(.orange)
            .stroke(.red, lineWidth: 2)
            
    }
    
    func completeView() -> some View {
        ZStack {
            Circle()
                .fill(.green)
                .stroke(.green, lineWidth: 2)
            Image(systemName: "checkmark")
                .foregroundColor(.white)
                .font(.caption2)
                .fontWeight(.black)
        }
    }
}

#Preview {
    ZStack {
        Color(.mainBackground)
        ActivityStatusIndicatorView(status: .active)
    }
}