//
//  SidebarViewToolbar.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/15/24.
//

import SwiftUI

struct SidebarViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @State var showingAwards = false
    
    var body: some View {
        Button(action: dataController.newTag) {
            Label("Add Tag", systemImage: "plus")
        }
        
        Button {
            showingAwards.toggle()
        } label: {
            Label("Show Awards", systemImage: "rosette")
        }
        .sheet(isPresented: $showingAwards, content: AwardsView.init)
        
        #if DEBUG
        Button {
            dataController.deleteAll()
            dataController.createSampleData()
        } label: {
            Label("Add Samples", systemImage: "flame")
        }
        #endif
    }
}

#Preview {
    SidebarViewToolbar()
        .environmentObject(DataController.preview)
}
