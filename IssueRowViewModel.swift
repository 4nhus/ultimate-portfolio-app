//
//  IssueRowViewModel.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/16/24.
//

import Foundation

extension IssueRow {
    @dynamicMemberLookup
    class ViewModel: ObservableObject {
        let issue: Issue

        var iconOpacity: Double {
            issue.priority == 2 ? 1 : 0
        }

        var iconIdentifier: String {
            issue.priority == 2 ? "\(issue.issueTitle) High Priority" : ""
        }

        var accessibilityHint: String {
            issue.priority == 2 ? "High priority" : ""
        }

        var creationDate: String {
            issue.issueCreationDate.formatted(date: .numeric, time: .omitted)
        }

        var accessibilityCreationDate: String {
            issue.issueCreationDate.formatted(date: .abbreviated, time: .omitted)
        }

        init(issue: Issue) {
            self.issue = issue
        }

        subscript<Value>(dynamicMember keypath: KeyPath<Issue, Value>) -> Value {
            issue[keyPath: keypath]
        }
    }
}
