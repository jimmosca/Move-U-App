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
    
    // MARK: - Configure methods -
    func configureCell(data: Exercise) {
        configure(name: data.name)
        configure(dificulty: data.dificulty)
    }
    
    private func configure(name: String?) {
        eName?.text = name
    }
    
    private func configure(dificulty: String?) {
        eDificulty?.text = dificulty
    }
}
