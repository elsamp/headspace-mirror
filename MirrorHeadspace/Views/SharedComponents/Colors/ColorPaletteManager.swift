//
//  ColorPaletteManager.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-08.
//

import Foundation

struct ColorPaletteManager {
    
    static let shared = ColorPaletteManager()
    
    private init() {}
    
    func colorPalette(for theme: ColorTheme) -> ColorPalette {
        
        switch theme {
            
        case .orange:
            return ColorPalette(mainColor: .orangeMain,
                                backgroundColor: .orangeBackground,
                                lightSecondaryColor: .orangeSecondaryLight,
                                darkSecondaryColor: .orangeSecondaryDark)
        case .purple:
            return ColorPalette(mainColor: .purpleMain,
                                backgroundColor: .purpleBackground,
                                lightSecondaryColor: .purpleSecondaryLight,
                                darkSecondaryColor: .purpleSecondaryDark)
        case .blue:
            return ColorPalette(mainColor: .blueMain,
                                backgroundColor: .blueBackground,
                                lightSecondaryColor: .blueSecondaryLight,
                                darkSecondaryColor: .blueSecondaryDark)
        case .pink:
            return ColorPalette(mainColor: .pinkMain,
                                backgroundColor: .pinkBackground,
                                lightSecondaryColor: .pinkSecondaryLight,
                                darkSecondaryColor: .pinkSecondaryDark)
        case .yellow:
            //TODO: make this yellow
            return ColorPalette(mainColor: .orangeMain,
                                backgroundColor: .orangeBackground,
                                lightSecondaryColor: .orangeSecondaryLight,
                                darkSecondaryColor: .orangeSecondaryDark)
        case .green:
            //TODO: make this green
            return ColorPalette(mainColor: .orangeMain,
                                backgroundColor: .orangeBackground,
                                lightSecondaryColor: .orangeSecondaryLight,
                                darkSecondaryColor: .orangeSecondaryDark)
        }
    }
    
}
