//
//  ViewController.swift
//  BankApp
//
//  Created by Anderson Lentz on 02/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statmentTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        statmentTableView.delegate = self
        statmentTableView.dataSource = self
        
        let headerNib = UINib.init(nibName: "StatementHeader", bundle: Bundle.main)
        statmentTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "StatementHeader")
    }
}

extension ViewController : UITableViewDelegate {

}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StatementHeader") as! StatementViewHeader
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! PaymentTableViewCell
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // this will turn on `masksToBounds` just before showing the cell
//        cell.contentView.layer.masksToBounds = true
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
   
    
}
