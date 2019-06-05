//
//  Exercise.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

class Exercise{
    var name: String?
    var photo: String?
    var area: String?
    var dificulty: String?
    var description: String?
    
    
    convenience init(name: String? = nil, photo: String? = nil, area: String? = nil, dificulty: String? = nil, description: String? = nil) {
        self.init()
        self.name = name
        self.photo = photo
        self.area = area
        self.dificulty = dificulty
        self.description = description
        
    }
}
