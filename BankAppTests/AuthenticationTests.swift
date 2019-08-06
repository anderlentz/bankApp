//
//  AuthenticationTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

@testable import BankApp
import XCTest


class AuthenticationTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: AuthWorker!
    
    override func setUp() {
        sut = AuthWorker()
    }

    override func tearDown() {
    }

    // MARK: - Tests
    
    func testShouldValidadeUserLoginEmail(){
        let corretUser = Seeds.ValidUserLogin.email
        let result = sut.validateUser(user: corretUser)
        
    XCTAssert(result.0,"Shoul validate correct user login email")
        
    }
    
    func testShouldValidadeUserLoginEmail_WithEmptyEntry(){
        let corretUser = ""
        let result = sut.validateUser(user: corretUser)
        
        XCTAssertFalse(result.0,"Shoul validate correct user login email")
        
    }
    
    func testShouldInvalidatePassword_WithoutAtLeastOneCapitalLetter(){
        let incorretPassword = Seeds.InvalidUserLogin.passwordWithoutCapital
        let result = sut.validatePassword(password: incorretPassword)
        
          XCTAssertFalse(result.0,"Shoul invalidate incorret password - must have at least one capital letter")
        
    }
    
    func testShouldInvalidatePassword_WithoutAtLeastOneSpecialChar(){
        let incorretPassword = Seeds.InvalidUserLogin.passwordWithoutSpecialChar
        let result = sut.validatePassword(password: incorretPassword)
        
        XCTAssertFalse(result.0,"Shoul invalidate incorret password - must have at least one special character")
        
    }
    
    func testShouldInvalidatePassword_WithoutAtLeastOneNumberChar(){
        let incorretPassword = Seeds.InvalidUserLogin.passwordWithoutNBumber
        let result = sut.validatePassword(password: incorretPassword)
        
        XCTAssertFalse(result.0,"Shoul invalidate incorret password - must have at least one number")
        
    }
}
