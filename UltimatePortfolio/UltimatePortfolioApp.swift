//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/8/24.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
