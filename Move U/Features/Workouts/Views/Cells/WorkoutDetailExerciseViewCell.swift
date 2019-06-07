//
//  WorkoutDetailViewCell.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit
class WorkoutDetailExerciseViewCell: UICollectionViewCell {
    static let eIdentifier: String = String(describing: WorkoutDetailExerciseViewCell.self)
    static let eEstimatedHeight: CGFloat = 100.0
    
    @IBOutlet weak var eName: UILabel!
    @IBOutlet weak var eDificulty: UILabel!
    
    override func prepareForReuse() {
        eName?.text = ""
        eDificulty?.text = ""
    }
    
    func update(data: Exercise) {
        update(name: data.name)
        update(dificulty: data.dificulty)
    }
    
    private func update(name: String?) {
        eName?.text = name
    }
    
    private func update(dificulty: String?) {
        eDificulty?.text = dificulty
    }
}
