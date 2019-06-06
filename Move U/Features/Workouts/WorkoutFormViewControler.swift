//
//  WorkoutFormViewControler.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class WorkoutFormViewController: UIViewController {
    
    @IBOutlet weak var wNameText: UITextField!
    @IBOutlet weak var wGoalText: UITextView!
    @IBOutlet weak var wLevelText: UITextField!
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Guardar entrenamiento",
                                      message: "Deseas continuar añadiendo el elemento especificado?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        // add buttons
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: UIAlertActionStyle.default,
                                      handler: { action in
                                        self.saveWorkout();
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
    
    func saveWorkout(){
        defaultWorkouts.append(Workout(name: wNameText.text, goal: wGoalText.text, level: wLevelText.text))
        dismiss(animated: true, completion: nil)
    }
}
