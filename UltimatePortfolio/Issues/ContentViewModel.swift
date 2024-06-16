//
//  ContentViewModel.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/16/24.
//

import Foundation

extension ContentView {
    @dynamicMemberLookup
    class ViewModel: ObservableObject {
        var dataController: DataController

        init(dataController: DataController) {
            self.dataController = dataController
        }

        subscript<Value>(dynamicMember keyPath: KeyPath<DataController, Value>) -> Value {
            dataController[keyPath: keyPath]
        }

        subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<DataController, Value>) -> Value {
            get { dataController[keyPath: keyPath] }
            set { dataController[keyPath: keyPath] = newValue }
        }

        func delete(_ offsets: IndexSet) {
            let issues = dataController.issuesForSelectedFilter()

            for offset in offsets {
                let issue = issues[offset]
                dataController.delete(issue)
            }
        }
    }
}
