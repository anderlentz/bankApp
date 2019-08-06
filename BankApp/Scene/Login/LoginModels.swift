//
//  WelcomeModels.swift
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

enum Login
{
    // MARK: Use cases
    
    enum UserLogin
    {
        struct Request
        {
            var userID: String
            var password: String
        }
        struct Response
        {
            var success: Bool
            var loggedUser: User?
            var message:String
        }
        struct ViewModel
        {
            var success: Bool
            var loggedUser: User
        }
    }
}