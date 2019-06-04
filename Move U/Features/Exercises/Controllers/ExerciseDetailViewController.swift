//
//  ExerciseDetailViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 4/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class ExerciseDetailViewController: UIViewController {
    
    @IBOutlet weak var eExerciseName: UILabel!
    @IBOutlet weak var eExerciseArea: UILabel!
    @IBOutlet weak var eExerciseDificultad: UILabel!
    @IBOutlet weak var eExerciseDescription: UITextView!
    
    @IBOutlet weak var eExerciseImage: UIImageView!
    
    private var exerciseData: Exercise? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let exercise = exerciseData else {
            return
        }
        update(data: exercise)
    }
    
    func set(exerciseData: Exercise) {
        self.exerciseData = exerciseData
    }
    

    private func update(data: Exercise) {
        update(name: data.name)
        update(area: data.area)
        update(dificulty: data.dificulty)
        update(description: data.description)
        update(photo: data.photo)
    }
    
    private func update(name: String?) {
        eExerciseName.text = name
    }
    
    private func update(area: String?) {
        eExerciseArea.text = area
    }
    
    private func update(dificulty: String?) {
        eExerciseDificultad.text = dificulty
    }
    
    private func update(description: String?) {
        eExerciseDescription.text = description
    }
    
    private func update(photo: String?) {
        guard let image = photo else {
            return
        }
        eExerciseImage.image = UIImage(named: image)
    }
}
