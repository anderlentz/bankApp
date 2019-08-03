//
//  UserStore.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation

class UserStore: UserStoreProtocol{
    
    
    
    func fetchUser(completion: @escaping ((User) -> Void)) {
        completion(User(userId: 1, name: "João", bankAccount: "03901339", agency: "45883", balance: 3000.0))
    }
    
    
}
