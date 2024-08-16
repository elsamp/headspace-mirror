//
//  NodePositionKey.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-06.
//

import SwiftUI

struct NodePositionKey: PreferenceKey {
    
    static var defaultValue: [String: CGPoint] { [:]  }
    
    static func reduce(value: inout [String: CGPoint], nextValue: () -> [String: CGPoint]) {
        let next = nextValue()
        
        if let item = next.first {
            value[item.key] = item.value
        }
    }
}
