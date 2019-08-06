//
//  LoginViewControllerTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//
@testable import BankApp
import XCTest

class LoginViewControllerTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: LoginViewController!
    var window: UIWindow!

    override func setUp() {
        
        window = UIWindow()
        setupLoginViewController()
    }

    override func tearDown() {
        window = nil
        
    }

    func setupLoginViewController(){
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? LoginViewController
    }

    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class LoginBusinessLogicSpy: LoginBusinessLogic{
        
        // MARK: Method call expectations
        
        var loginCalled = false
        
        // MARK: Spied methods
        
        func login(request: Login.UserLogin.Request) {
            loginCalled = true
        }

    }
    
    // MARK: - Tests
    
    func testShouldCallLoginFunction(){
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        let correctPassword = Seeds.ValidUserLogin.password
        let correctEmail = Seeds.ValidUserLogin.email
        sut.interactor = loginBusinessLogicSpy
        
        //When
        let request = Login.UserLogin.Request(userID: correctEmail, password: correctPassword)
        sut.interactor?.login(request: request)
        
        // Then
        XCTAssert(loginBusinessLogicSpy.loginCalled, "Should call login function")
    }
    
    
}
