//
//  MockedStatementStore.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation
@testable import BankApp
import XCTest

class MockedStatementStore: StatementStoreProtocol{
    
    // Give
    let loggedUser = Seeds.UserTest.loggedUser
    
    func fetchRecentStatements(userID: Int?, completion: @escaping ([Statement], OrdersStoreError?) -> Void) {
        completion([Seeds.Statements.statement],nil)
    }
}
