//
//  SidebarViewToolbar.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/15/24.
//

import SwiftUI

struct SidebarViewToolbar: ToolbarContent {
    @EnvironmentObject var dataController: DataController
    @State private var showingAwards = false
    @State private var showingStore = false

    var body: some ToolbarContent {
        ToolbarItem(placement: .automaticOrTrailing) {
            Button(action: tryNewTag) {
                Label("Add Tag", systemImage: "plus")
            }
            .sheet(isPresented: $showingStore, content: StoreView.init)
            .help("Add Tag")
        }

        ToolbarItem(placement: .automaticOrLeading) {
            Button {
                showingAwards.toggle()
            } label: {
                Label("Show Awards", systemImage: "rosette")
            }
            .sheet(isPresented: $showingAwards, content: AwardsView.init)
            .help("Show Awards")
        }

//        #if DEBUG
//        ToolbarItem(placement: .automatic) {
//            Button {
//                dataController.deleteAll()
//                dataController.createSampleData()
//            } label: {
//                Label("Add Samples", systemImage: "flame")
//            }
//        }
//        #endif
    }

    func tryNewTag() {
        if dataController.newTag() == false {
            showingStore = true
        }
    }
}
