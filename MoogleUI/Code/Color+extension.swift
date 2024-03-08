//
//  Color+extension.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 8/3/24.
//

import Foundation
import SwiftUI

extension Color {
    static let moogle = Color.MoogleColor()
    
    struct MoogleColor {
        let background = Color("ColorBG")
        let secondary = Color("ColorSecondary")
        let text = Color("ColorText")
    }
}
