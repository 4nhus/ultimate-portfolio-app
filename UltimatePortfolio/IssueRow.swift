//
//  IssueRow.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/10/24.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue
    
    var body: some View {
        NavigationLink(value: issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(issue.priority == 2 ? 1 : 0)
                
                VStack(alignment: .leading) {
                    Text(issue.issueTitle)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text("No tags")
                        .foregroundStyle(.secondary)
                        .lineLimit(2...2)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(issue.issueCreationDate.formatted(date: .numeric, time: .omitted))
                        .font(.subheadline)
                    
                    if issue.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
            }
        }
    }
}

#Preview {
    IssueRow(issue: .example)
}
