//
//  Suplement.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

class Suplement: CustomStringConvertible{
    var name: String?
    var photo: String?
    var usage: String?
    var price: Double?
    var whenToUse: String?
    
    
    
    public var description: String {
        return """
        
        """
    }
    
    convenience init(name: String? = nil, photo: String? = nil, usage: String? = nil, price: Double? = nil, whenToUse: String? = nil) {
        self.init()
        self.name = name
        self.photo = photo
        self.usage = usage
        self.price = price
        self.whenToUse = whenToUse
        
    }
}
