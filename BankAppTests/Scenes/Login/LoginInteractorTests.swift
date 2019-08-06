//
//  LoginInteractorTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//
@testable import BankApp
import XCTest

class LoginInteractorTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: LoginInteractor!
    
    override func setUp() {
        setupLoginInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginInteractor()
    {
        sut = LoginInteractor()
    }
    
    class LoginPresentationLogicSpy : LoginPresentationLogic{
        
        // MARK: Method call expectations
        var presentStatements = false
        var presentWarningMessage = false
        
        // MARK: Spied methods
        func presentStatements(response: Login.UserLogin.Response) {
            presentWarningMessage = true
        }
        
        func presentWarningMessage(response: Login.UserLogin.Response) {
            presentWarningMessage = true
        }
    }
    
    class LoginWorkerSpy: LoginWorker{
        
        // MARK: Method call expectations
        
        var loginCalled = false
        
        // MARK: Spied methods
        
        override
        func login(user: String, password: String, completion: @escaping ((User) -> Void)) {
            loginCalled = true
            completion(Seeds.UserTest.loggedUser)
        }
    }
    
    // MARK: - Tests
    
    func testShouldskLoginWorker_ToLogUser(){
       // Given
        
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        let mockedUserStore = MockedUserStore()
        let loginWorkerSpy = LoginWorkerSpy(userStore: mockedUserStore)
        sut.worker = loginWorkerSpy
        
        
        //When
        let validEmail = Seeds.ValidUserLogin.email
        let validPassword = Seeds.ValidUserLogin.password
        let request = Login.UserLogin.Request(userID: validEmail,
                                              password: validPassword)
        sut.login(request: request)
        
        // Then
        XCTAssert(loginWorkerSpy.loginCalled, "login() should ask StatementWorker to fetch logged user")
    
    }
    
    
}
