//
//  MockedUserStore.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation
@testable import BankApp
import XCTest

class MockedUserStore: UserStoreProtocol{
    
    func fetchUser(user: String, password: String, completion: @escaping ((User?, UserStoreError?) -> Void)) {
        completion(Seeds.UserTest.loggedUser,nil)
    }
    
    
}
