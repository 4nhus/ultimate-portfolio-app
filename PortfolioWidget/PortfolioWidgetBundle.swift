//
//  PortfolioWidgetBundle.swift
//  PortfolioWidget
//
//  Created by Anh on 6/21/24.
//

import WidgetKit
import SwiftUI

@main
struct PortfolioWidgetBundle: WidgetBundle {
    var body: some Widget {
        SimplePortfolioWidget()
        ComplexPortfolioWidget()
    }
}
