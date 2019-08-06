//
//  StatementViewControllerTests.swift
//  BankAppTests
//
//  Created by Anderson Lentz on 06/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//
@testable import BankApp
import XCTest

class StatementViewControllerTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: StatementViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        //setupStatementViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: - Test setup
    
    func setupStatementViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "StatementViewController") as? StatementViewController
        print(sut.debugDescription)
        
        
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class StatementBusinessLogicSpy: StatementBusinessLogic{
        
        var statements:[Statement]?
        
        // MARK: Method call expectations
        var fechRecentStatementsCalled = false
        var getLoggesUserCalled = false
        
        func fechRecentStatements(request: RecentStatements.FechStatements.Request) {
            fechRecentStatementsCalled = true
        }
        
        func getLoggesUser(request: RecentStatements.LoggedUser.Request) {
            getLoggesUserCalled = true
        }
    }
    
    class TableViewSpy:UITableView{
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
//    func testShouldFechRecentStatementsViewDidAppear(){
//        // Given
//        let statementBusinessLogicSpy = StatementBusinessLogicSpy()
//        sut.interactor = statementBusinessLogicSpy
//        loadView()
//        
//        //When
//        sut.viewDidAppear(true)
//        
//        // Then
//        XCTAssert(statementBusinessLogicSpy.fechRecentStatementsCalled, "Should fetch recent statements right after the view appears")
//    }
    
    

}
