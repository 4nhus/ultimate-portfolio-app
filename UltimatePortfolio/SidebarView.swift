//
//  SidebarView.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/10/24.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    
    let smartFilters: [Filter] = [.all, .recent]
    
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.tagId, name: tag.tagName, icon: "tag", tag: tag)
        }
    }
    
    var body: some View {
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                            .badge(filter.tag?.tagActiveIssues.count ?? 0)
                    }
                }
                .onDelete(perform: delete)
            }
        }
        .toolbar {
            Button {
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("Add Samples", systemImage: "flame")
            }
        }
    }
    
    func delete(_  offsets: IndexSet) {
        for offset in offsets {
            let tag = tags[offset]
            dataController.delete(tag)
        }
    }
}

#Preview {
    SidebarView()
        .environmentObject(DataController.preview)
}