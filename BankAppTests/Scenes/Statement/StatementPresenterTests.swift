//
//  StatementPresenterTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

@testable import BankApp
import XCTest

class StatementPresenterTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: StatementPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupStatementPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Test setup
    
    func setupStatementPresenter()
    {
        sut = StatementPresenter()
        
    }
    
    // MARK: - Test doubles
    
    class StatementDisplayLogicSpy: StatementDisplayLogic
    {
         // MARK: Method call expectations
        var displayFechedRecentStatements = false
        var displayLoggedUser = false
        
        // MARK: Argument expectations
        
        var viewModel: RecentStatements.FechStatements.ViewModel!
        
        // MARK: Spied methods
        
        func displayFechedRecentStatements(viewModel: RecentStatements.FechStatements.ViewModel) {
            displayFechedRecentStatements = true
            self.viewModel = viewModel
        }
        
        func displayLoggedUser(viewModel: RecentStatements.LoggedUser.ViewModel) {
            displayLoggedUser = true
        }
    }
    
     // MARK: - Tests
    
    func testPresentFetchedStatements_ShouldAskViewControllerToDisplayRecentStatements()
    {
        // Given
        let statementDisplayLogicSpy = StatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogicSpy
        
        // When
        let statements = [Seeds.Statements.statement]
        let response = RecentStatements.FechStatements.Response(statements: statements)
        sut.presentFechedStatements(response: response)
        
        
        // Then
        XCTAssert(statementDisplayLogicSpy.displayFechedRecentStatements,"Presenting fetched recent statements should ask view controller to display them")
    }
    
    func testPresentLoggedUser_ShouldAksViewControllerDisplayLoggedUser(){
        // Given
        let statementDisplayLogicSpy = StatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogicSpy
        
        // When
        let loggedUser = Seeds.UserTest.loggedUser
        let response = RecentStatements.LoggedUser.Response(loggedUser: loggedUser)
        sut.presentLoggedUser(response: response)
        
        // Then
        XCTAssert(statementDisplayLogicSpy.displayLoggedUser,"Presenting logged user should ask view controller to display them")
    }

}
