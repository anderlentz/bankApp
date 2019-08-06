//
//  LoginPresenterTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginPresenterTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: LoginPresenter!
    
    override func setUp() {
        setupLoginPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func setupLoginPresenter(){
        sut = LoginPresenter()
    }
    
    
    // MARK: - Test doubles
    
    class LoginDisplayLogicSpy: LoginDisplayLogic
    {
        
        // MARK: Method call expectations
        var displayStatementsCalled = false
        var displayWarningLoginMessageCalled = false
        
        // MARK: Argument expectations
        
        var viewModel: Login.UserLogin.ViewModel!
        
        // MARK: Spied methods
        
        func displayStatements(viewModel: Login.UserLogin.ViewModel) {
            displayStatementsCalled = true
            self.viewModel = viewModel
        }
        
        func displayWarningLoginMessage(response: Login.UserLogin.Response) {
            displayWarningLoginMessageCalled = true
            
        }
    }
    
    // MARK: - Tests
    
    func testPresentStatements_ShouldAskViewControllerToDisplayStatetmens_WhenUserIsLogged(){
        
        //Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        let isLoggedUser = true
        let loggedUser = Seeds.UserTest.loggedUser
        let message = "OK"
        
        // When
        let response = Login.UserLogin.Response(success: isLoggedUser, loggedUser: loggedUser, message: message)
        sut.presentStatements(response: response)
        
        // Then
        XCTAssert(loginDisplayLogicSpy.displayStatementsCalled,"presentStatements() should ask view controller to display when user is logged")
    
    }
    
    func testPresentStatements_ShouldAskViewControllerToDisplayWarningMessage_WhenUserIsNotLogged(){
        
        //Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        let isLoggedUser = false
        let message = "Password deve conter pelo menos uma letra maiúscula"
        
        // When
        let response = Login.UserLogin.Response(success: isLoggedUser, loggedUser: nil, message: message)
        sut.presentWarningMessage(response: response)
        
        // Then
        XCTAssert(loginDisplayLogicSpy.displayWarningLoginMessageCalled,"presentStatements() should ask view controller to display warning message when login inputs does not match the requirements")
        
    }

}
