//
//  WelcomeWorker.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright (c) 2019 Anderson Lentz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class LoginWorker
{
    
    var userStore:UserStoreProtocol
    
    init(userStore: UserStoreProtocol) {
        self.userStore = userStore
    }
    
    func login(user:String,password:String,completion: @escaping ((User) -> Void)) {
        userStore.fetchUser(user: user, password: password) { user,error  in
            
            if let userFromServer = user{
                completion(userFromServer)
            }
            
        }
    }
}
