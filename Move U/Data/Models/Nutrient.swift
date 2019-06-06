//
//  Nutrient.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

class Nutrient: CustomStringConvertible{
    var name: String?
    var photo: String?
    var funtion: String?
    var recomendedQty: String?
    var calorieGram: String?
    
    
    
    public var description: String {
        return """
        
        """
    }
    
    convenience init(name: String? = nil, photo: String? = nil, funtion: String? = nil, recomendedQty: String? = nil, calorieGram: Int? = nil) {
        self.init()
        self.name = name
        self.photo = photo
        self.funtion = funtion
        self.recomendedQty = recomendedQty
        guard let calorie = calorieGram else {
            return
            
        }
        self.calorieGram = "\(calorie) kCal/g"
        
    }
}
