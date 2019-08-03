//
//  PaymentTableViewCell.swift
//  BankApp
//
//  Created by Anderson Lentz on 02/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var paymentNameLabel: UILabel!
    
    @IBOutlet weak var paymentDayLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       /*
        self.layer.borderWidth = 0.6
        self.layer.borderColor = UIColor(red: 0.54, green: 0.54, blue: 0.54, alpha: 0.25).cgColor
        
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0.54, green: 0.54, blue: 0.54, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 2.3)
        self.layer.shadowRadius = 3*/

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
