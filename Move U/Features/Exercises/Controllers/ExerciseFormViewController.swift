//
//  ExerciseFormViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 5/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class ExerciseFormViewController: UIViewController {
    
    @IBOutlet weak var eNameText: UITextField!
    @IBOutlet weak var eAreaText: UITextField!
    @IBOutlet weak var eDificultyText: UITextField!
    @IBOutlet weak var eDescriptionText: UITextView!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Guardar ejercicio",
                                      message: "Deseas continuar añadiendo el elemento especificado?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        // add buttons
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: UIAlertActionStyle.default,
                                      handler: { action in
                                        self.saveExercise();
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertActionStyle.cancel,
                                      handler: nil))
        // show alert
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func saveExercise(){
        defaultExercises.append(Exercise(name: eNameText.text, area: eAreaText.text, dificulty: eDificultyText.text, description: eDescriptionText.text))
        dismiss(animated: true, completion: nil)
    }
}
