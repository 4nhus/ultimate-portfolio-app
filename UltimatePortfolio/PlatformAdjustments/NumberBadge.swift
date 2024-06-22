//
//  NumberBadge.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/22/24.
//

import SwiftUI

extension View {
    func numberBadge(_ number: Int) -> some View {
        #if os(watchOS)
        self
        #else
        self.badge(number)
        #endif
    }
}
