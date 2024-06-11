//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/8/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    
    var issues: [Issue] {
        let filter = dataController.selectedFilter ?? .all
        var allIssues: [Issue]
        
        if let tag = filter.tag {
            allIssues = tag.issues?.allObjects as? [Issue] ?? []
        } else {
            let request = Issue.fetchRequest()
            request.predicate = NSPredicate(format: "modificationDate > %@", filter.minModificationDate as NSDate)
            allIssues = (try? dataController.container.viewContext.fetch(request)) ?? []
        }
        return allIssues.sorted()
    }

    var body: some View {
        List(selection: $dataController.selectedIssue) {
            ForEach(issues) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Issues")
    }
    
    func delete(_ offsets: IndexSet) {
        for offset in offsets {
            let issue = issues[offset]
            dataController.delete(issue)
        }
    }
}

#Preview {
    ContentView().environmentObject(DataController.preview)
}
