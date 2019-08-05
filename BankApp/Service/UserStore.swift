//
//  UserStore.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import Foundation

class UserStore: UserStoreProtocol{
    
    private let loginURL = "https://bank-app-test.herokuapp.com/api/login"

    
    func fetchUser(user: String, password: String, completion: @escaping ((User?, UserStoreError?) -> Void)) {
        
        guard let loginURL = URL(string: loginURL) else {
            return
        }
        
        let parameters = ["user": user, "password": password]
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            completion(nil,UserStoreError.CannotFetch(error.localizedDescription))
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(nil,UserStoreError.CannotFetch(error.localizedDescription))
            }
            
            //Parse JSON data
            if let data = data{
                if let user = self.parseJsonData(data: data){
                    completion(user,nil)
                }
            }
        }
        task.resume()
    }
    
    func parseJsonData(data:Data) -> User?{
        
        do {
            
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            //Parse JSON
            let jsonUser = jsonResult?["userAccount"] as! [String:Any]
            
            let user = User(userId: jsonUser["userId"] as! Int,
                        name: jsonUser["name"] as! String,
                        bankAccount: jsonUser["bankAccount"] as! String,
                        agency: jsonUser["agency"] as! String,
                        balance: Float(jsonUser["balance"] as! NSNumber))
            
            return user
        }catch{
            return nil
        }
    }
}
