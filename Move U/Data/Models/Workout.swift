//
//  Workout.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

class Workout: CustomStringConvertible{
    var name: String?
    var photo: String?
    var goal: String?
    var level: String?
    var exercises: [Exercise]?
    
    
    
    public var description: String {
        return """
        
        """
    }
    
    convenience init(name: String? = nil, photo: String? = nil, goal: String? = nil, level: String? = nil, exercises: [Exercise]? = nil) {
        self.init()
        self.name = name
        self.photo = photo
        self.goal = goal
        self.level = level
        self.exercises = exercises
        
    }
}
