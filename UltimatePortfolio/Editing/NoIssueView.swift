//
//  NoIssueView.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/11/24.
//

import SwiftUI

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController

    var body: some View {
        Text("No Issue Selected!")
            .font(.title)
            .foregroundStyle(.secondary)

        Button("New Issue", action: dataController.newIssue)
    }
}

#Preview {
    NoIssueView()
        .environmentObject(DataController.preview)
}
