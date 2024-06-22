//
//  IssueRow.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/10/24.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel: ViewModel

    init(issue: Issue) {
        let viewModel = ViewModel(issue: issue)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationLink(value: viewModel.issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(viewModel.iconOpacity)
                    .accessibilityIdentifier(viewModel.iconIdentifier)

                VStack(alignment: .leading) {
                    Text(viewModel.issueTitle)
                        .font(.headline)
                        .lineLimit(1)

                    Text(viewModel.issueTagsList)
                        .foregroundStyle(.secondary)
                        .lineLimit(2...2)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(viewModel.creationDate)
                        .accessibilityLabel(viewModel.accessibilityCreationDate)
                        .font(.subheadline)

                    if viewModel.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
            }
        }
        .accessibilityHint(viewModel.accessibilityHint)
        .accessibilityIdentifier(viewModel.issueTitle)
    }
}

#Preview {
    IssueRow(issue: .example)
        .environmentObject(DataController.preview)
}
