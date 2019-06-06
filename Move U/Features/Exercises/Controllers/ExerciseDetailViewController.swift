//
//  ExerciseDetailViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 4/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit


protocol ExerciseDetailDelegate {
    func onDelete(exerciseName: String?)
}

class ExerciseDetailViewController: UIViewController {
    
    @IBOutlet weak var eExerciseName: UILabel!
    @IBOutlet weak var eExerciseArea: UILabel!
    @IBOutlet weak var eExerciseDificultad: UILabel!
    @IBOutlet weak var eExerciseDescription: UITextView!
    
    @IBOutlet weak var eExerciseImage: UIImageView!
    
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Borrar ejercicio",
                                      message: "Al borrar este ejercicio no podrás volver a acceder a él.¿Estas seguro de querer continuar?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        // add buttons
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: UIAlertActionStyle.destructive,
                                      handler: { action in
                                        self.navigateBack();
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertActionStyle.cancel,
                                      handler: nil))
        // show alert
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    var delegate: ExerciseDetailDelegate?
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
    
    private func navigateBack() {
        // Llamamos al metodo borrar del delegado asociado
        delegate?.onDelete(exerciseName: exerciseData?.name)
        // Llamamos al metodo, adecuado para el tipo de navegacion, para volver a la pantalla anterior
        navigationController?.popViewController(animated: true)
    }
    
}
