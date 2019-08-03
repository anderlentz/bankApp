//
//  UserStoreProtcol.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation

protocol UserStoreProtocol {
    func fetchUser(completion: @escaping ((User)->Void))
}
