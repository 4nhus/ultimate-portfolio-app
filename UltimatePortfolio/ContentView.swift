//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/8/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        Text("Content")
    }
}



#Preview {
    ContentView().environment(\.managedObjectContext, DataController.preview.container.viewContext)
}
