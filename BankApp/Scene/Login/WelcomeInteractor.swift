//
//  WelcomeInteractor.swift
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

protocol LoginBusinessLogic
{
    func login(request: Login.UserLogin.Request)

}

protocol LoginDataStore
{
    var loggedUser: User? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    func validateUser(request: Login.UserLogin.Request) {
        
    }
    
    func validadePassword(request: Login.UserLogin.Request) {
        
    }
    
    var loggedUser: User?
    
    
    var presenter: LoginPresentationLogic?
    var worker = LoginWorker(userStore: UserStore())
    
    
    // MARK: Do login
    
    func login(request: Login.UserLogin.Request)
    {
        
        
        let user = request.userID
        let password = request.password
        let authWorker = AuthWorker()
        
        let auth = authWorker.login(userID: user, password: password)
        
        if auth.0 {
            worker.login(user: user, password: password) { (userFromServer) in
                self.loggedUser = userFromServer
                let response = Login.UserLogin.Response(success: true,loggedUser: userFromServer,message: auth.1)
                self.presenter?.presentStatements(response: response)
                authWorker.saveUserID(userFromServer.userId)
            }
        }
        else{
            let response = Login.UserLogin.Response(success: false,loggedUser: nil,message: auth.1)
            self.presenter?.presentWarningMessage(response: response)
        }
    }
}