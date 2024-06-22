//
//  InlineNavigationBar.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/22/24.
//

import SwiftUI

extension View {
    func inlineNavigationBar() -> some View {
        #if os(macOS)
        self
        #else
        self.navigationBarTitleDisplayMode(.inline)
        #endif
    }
}
