//
//  StatementModels.swift
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

enum RecentStatements
{
  // MARK: Use cases
  
  enum FechStatements
  {
    struct Request
    {
        var userID: String
    }
    struct Response
    {
        var statements:[Statement]
    }
    struct ViewModel
    {
        struct DisplayedStatement {
            var title:String
            var description:String
            var date: String
            var value: String
        }
        var displayedStatements:[DisplayedStatement]
    }
  }
}
