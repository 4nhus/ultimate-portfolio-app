//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/8/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    @StateObject var viewModel: ViewModel

    init(dataController: DataController) {
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(selection: $viewModel.selectedIssue) {
            ForEach(viewModel.dataController.issuesForSelectedFilter()) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Issues")
        .searchable(
            text: $viewModel.filterText,
            tokens: $viewModel.filterTokens,
            suggestedTokens: .constant(viewModel.suggestedFilterTokens),
            prompt: "Filter issues, or type # to add tags") { tag in
            Text(tag.tagName)
        }
        .toolbar(content: ContentViewToolbar.init)
        .onAppear(perform: askForReview)
        .onOpenURL(perform: openURL)
    }

    func askForReview() {
        if viewModel.shouldRequestReview {
            requestReview()
        }
    }

    func openURL(_ url: URL) {
        if url.absoluteString.contains("newIssue") {
            viewModel.newIssue()
        }
    }

    func resumeActivity(_ userActivity: NSUserActivity) {
        viewModel.newIssue()
    }
}

#Preview {
    ContentView(dataController: DataController.preview)
}
