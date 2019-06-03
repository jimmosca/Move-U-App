//
//  Exercise.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

class Exercise: CustomStringConvertible{
    var name: String?
    var photo: String?
    var area: String?
    var dificulty: String?
    var prerequisites: [Exercise]?
    
    
    
    public var description: String {
        return """

        """
    }
    
    convenience init(name: String? = nil, photo: String? = nil, area: String? = nil, dificulty: String? = nil, prerequisites: [Exercise]? = nil) {
        self.init()
        self.name = name
        self.photo = photo
        self.area = area
        self.dificulty = dificulty
        self.prerequisites = prerequisites
        
    }
}
