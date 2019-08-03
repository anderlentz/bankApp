//
//  StatementInteractor.swift
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

protocol StatementBusinessLogic
{
    //func doSomething(request: Statement.Something.Request)
    func fechRecentStatements(request: RecentStatements.FechStatements.Request)
}

protocol StatementDataStore
{
    var statements:[Statement]? { get }
    var loggedUser:User? { get set}
}

class StatementInteractor: StatementBusinessLogic, StatementDataStore
{
    var loggedUser: User?
    var presenter: StatementPresentationLogic?
    var statementWorker = StatementWorker(statementStore: StatementStore())
    var statements:[Statement]?
    
    
    // MARK: Fech recent statements
    
    func fechRecentStatements(request: RecentStatements.FechStatements.Request)
    {
        statementWorker.fetchRecentStatements(userID: request.userID) { statements in
            self.statements = statements
            let response = RecentStatements.FechStatements.Response(statements: statements)
            self.presenter?.presentFechedStatements(response: response)
        }
    }
}
