//
//  StatementPresenter.swift
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

protocol StatementPresentationLogic
{
    func presentFechedStatements(response: RecentStatements.FechStatements.Response)
}

class StatementPresenter: StatementPresentationLogic
{

    weak var viewController: StatementDisplayLogic?
    
    let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
    
    func formattValue(value:Float) -> String{
        return "R$ \(String(describing: currencyFormatter.string(from: NSNumber(value: value))))"
    }
    
    // MARK: Fetch statements
    
    func presentFechedStatements(response: RecentStatements.FechStatements.Response) {
        
        var displayedStatements: [RecentStatements.FechStatements.ViewModel.DisplayedStatement] = []
        
        for statement in response.statements{
            let date = statement.date
            let description = statement.description
            let title = statement.title
            let value = formattValue(value: statement.value)
            
            let displayedStatement = RecentStatements.FechStatements.ViewModel.DisplayedStatement(
                title: title,
                description: description,
                date: date,
                value: value)
            displayedStatements.append(displayedStatement)
        }
        
        let viewModel = RecentStatements.FechStatements.ViewModel(displayedStatements: displayedStatements)
        viewController?.displayFechedRecentStatements(viewModel: viewModel)
    }
    
}
