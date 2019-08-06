//
//  StatementInteractorTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//
@testable import BankApp
import XCTest

class StatementInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: StatementInteractor!

    override func setUp() {
        setupStatementInteractor()
    }

    override func tearDown() {
       super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupStatementInteractor()
    {
        sut = StatementInteractor()
    }
    
    class StatementPresentationLogicSpy : StatementPresentationLogic{
        
        // MARK: Method call expectations
        var presentFechedStatementsCalled = false
        var presentLoggedUserCalled = false
        
        func presentFechedStatements(response: RecentStatements.FechStatements.Response) {
            presentFechedStatementsCalled = true
        }
        
        func presentLoggedUser(response: RecentStatements.LoggedUser.Response) {
            presentLoggedUserCalled = true
        }
    }

    
    class StatementWorkerSpy: StatementWorker{
        
        // MARK: Method call expectations
        
        var fetchRecentStatements = false
        
        // MARK: Spied methods
        override
        func fetchRecentStatements(userID: Int?, completion: @escaping ([Statement]) -> Void) {
            fetchRecentStatements = true
            completion([Seeds.Statements.statement])
        }
    }
    
    // MARK: - Tests
    
    func testShouldAskStatementWorker_ToFechStatemensAndPresenterToFormatResult()
    {
        // Given
        
        let statementPresentationLogicSpy = StatementPresentationLogicSpy()
        sut.presenter = statementPresentationLogicSpy
        let mockedStatementStore = MockedStatementStore()
        let statementWorkerSpy = StatementWorkerSpy(statementStore: mockedStatementStore)
        sut.statementWorker = statementWorkerSpy
        
        // When
        let request = RecentStatements.FechStatements.Request()
        sut.fechRecentStatements(request: request)
        
        // Then
        XCTAssert(statementWorkerSpy.fetchRecentStatements, "fetchRecentStatements() should ask StatementWorker to fetch recent statements")
        XCTAssert(statementPresentationLogicSpy.presentFechedStatementsCalled, "fetchRecentStatements() should ask presenter to format recent statements result")
    }


}
