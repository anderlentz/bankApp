//
//  StatementStore.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation

class StatementStore:StatementStoreProtocol{
    
    func fetchRecentStatements(userID: Int?, completion: @escaping ([Statement], OrdersStoreError?) -> Void) {
        
        guard let userId = userID else{
            return
        }
        
        let statetmentsServiceURL = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        
        guard let statementsURL = URL(string: statetmentsServiceURL) else {
            return
        }
        
        let request = URLRequest(url: statementsURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error)
                completion([],OrdersStoreError.CannotFetch(error.localizedDescription))
            }
            
            //Parse JSON data
            if let data = data{
            
                let statements = self.parseJsonData(jsonData: data)
                print("Statements from server ")
                print(statements)
                completion(statements,nil)
            }
        }
        task.resume()
    }
    
    func parseJsonData(jsonData:Data) -> [Statement]{
        
        do {
    
            let decoder = JSONDecoder()
          
            let statementsDataStore = try decoder.decode(StatementDataStore.self, from: jsonData)
            
            return statementsDataStore.statementList
        }catch{
            print(error)
            return []
        }
    }
}
