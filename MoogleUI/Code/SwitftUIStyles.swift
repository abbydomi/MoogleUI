//
//  SwitftUIStyles.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation
import SwiftUI

extension View {
    
    func gradientRadius() -> some View {
        self
        .background {
            Color.moogle.background
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Gradient(colors: [Color.moogle.light, Color.moogle.background]), lineWidth: 1)
        )
    }
    
    func titleStyle() -> some View {
        self
        .font(.system(.largeTitle, design: .rounded, weight: .bold))
        .foregroundStyle(Color.moogle.text)
    }
}
