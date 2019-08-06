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
        setupStatementViewController()
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
    
    func testShouldFechRecentStatementsViewDidAppear(){
        // Given
        let statementBusinessLogicSpy = StatementBusinessLogicSpy()
        sut.interactor = statementBusinessLogicSpy
        loadView()
        
        //When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssert(statementBusinessLogicSpy.fechRecentStatementsCalled, "Should fetch recent statements right after the view appears")
    }
    
    func testShouldDisplayFetchedRecentStatements(){
        
        //Given
        
        let tableviewSpy = TableViewSpy()
        sut.statementsTableView = tableviewSpy
        
        
        let displayedStatements =
            [RecentStatements.FechStatements.ViewModel.DisplayedStatement(
                title: "test",
                description: "description",
                date: "2018-12-07",
                value: "300.0")]
        
        //When
        let viewModel = RecentStatements.FechStatements.ViewModel(displayedStatements: displayedStatements)
        sut.displayFechedRecentStatements(viewModel: viewModel)
        
        // Then
        DispatchQueue.main.async {
            XCTAssert(tableviewSpy.reloadDataCalled, "Displaying fetched recent statemens should reload the table view")

        }
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne()
    {
        // Given
        let tableviewSpy = TableViewSpy()
        sut.statementsTableView = tableviewSpy
        
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableviewSpy)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
    
    func testNumberOfRowsInAnySectionShouldEqualNumberOfRecentStatmentsToDisplay()
    {
        //Given
        let tableviewSpy = TableViewSpy()
        sut.statementsTableView = tableviewSpy
        
        
        let displayedStatements =
            [RecentStatements.FechStatements.ViewModel.DisplayedStatement(
                title: "test",
                description: "description",
                date: "2018-12-07",
                value: "300.0")]
        
        sut.displayerdStatements = displayedStatements
        
        // When
        let numberOfRows = sut.tableView(tableviewSpy, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, displayedStatements.count, "The number of table view rows should equal the number of recent statemtents to display")
    }
    
}
