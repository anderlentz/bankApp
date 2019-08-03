//
//  StatementWorker.swift
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

class StatementWorker{
    var statmentStore: StatementStoreProtocol
    
    init(statementStore: StatementStoreProtocol) {
        self.statmentStore = statementStore
    }
    
    func fetchRecentStatements(userID: String,completion: @escaping ([Statement]) -> Void){
        statmentStore.fetchRecentStatements(userID: userID) { (statements, error) in
            if error == nil {
                DispatchQueue.main.async {
                    completion([])
                }
                
            }else{
                DispatchQueue.main.async {
                    completion(statements)
                }
            }
        }
    }
    
}

protocol StatementStoreProtocol {
    func fetchRecentStatements(userID: String,completion: @escaping ([Statement], OrdersStoreError?) -> Void )
}

// MARK: - Statement operation errors

enum OrdersStoreError: Equatable, Error
{
    case CannotFetch(String)
    
}