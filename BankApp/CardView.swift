//
//  CardView.swift
//  BankApp
//
//  Created by Anderson Lentz on 03/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable let cornerRadius: CGFloat = 5
    @IBInspectable let shadowColor: UIColor? = UIColor.black
    @IBInspectable let shadowOffSetWidth: Int = 0
    @IBInspectable let shadowOffSetHeight: Int = 1
    @IBInspectable let shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOpacity = shadowOpacity
        
    }

}
