//
//  TableViewCellExtension.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 4/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

extension UITableViewCell{
    
    func configure(cornerRadius: CGFloat = 8.0,
                   shadowOpacity: Float = 0.6,
                   color: CGColor = UIColor.gray.cgColor,
                   view: UIView?) {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.shadowColor = color
        view?.layer.shadowOffset = CGSize.zero
        view?.layer.shadowRadius = cornerRadius
        view?.layer.shadowOpacity = shadowOpacity
        view?.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
}
