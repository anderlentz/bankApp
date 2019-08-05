//
//  UserStoreProtcol.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation

protocol UserStoreProtocol {
    func fetchUser(user:String,password:String,completion: @escaping ((User?,UserStoreError?)->Void))
}

enum UserStoreError: Equatable, Error
{
    case CannotFetch(String)
    
}
