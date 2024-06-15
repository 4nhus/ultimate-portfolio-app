//
//  UltimatePortfolioUITests.swift
//  UltimatePortfolioUITests
//
//  Created by Anh on 6/15/24.
//

import CoreData
import XCTest
@testable import UltimatePortfolio

class BaseTestClass: XCTestCase {
    var dataController: DataController!
    var managedOjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedOjectContext = dataController.container.viewContext
    }
}
