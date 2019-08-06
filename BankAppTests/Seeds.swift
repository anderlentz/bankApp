//
//  Seeds.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//
@testable import BankApp
import XCTest

import Foundation

struct Seeds{
    struct Statements{
        static let statement = Statement(title: "Pagamento", desc: "Conta de luz", date: "2018-08-15", value: -50)
    }
    struct UserTest {
        static let loggedUser = User(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 50.0)
    }
}
