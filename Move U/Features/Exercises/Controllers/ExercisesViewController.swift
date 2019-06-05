//
//  ExercisesViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var eTableView: UITableView!
    
    private var data: [Exercise]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(tableView: eTableView)
        loadData()
        eTableView.reloadData()
    }
    func loadData(){
        data = defaultExercises
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableViewCell = sender as? UITableViewCell,
            let indexPath = eTableView.indexPath(for: tableViewCell) else {
                return
        }
        // Obtenemos el estudiante seleccionado
        let exerciseSelected = defaultExercises[indexPath.row]
        
        // Primero casteamos el ViewController destino a nuestro ViewController del detalle del estudiante
        if let destinationViewController = segue.destination as? ExerciseDetailViewController{
            
            destinationViewController.delegate = self
            // Segundo al ViewController le pasamos los datos del estudiante seleccionado
            destinationViewController.set(exerciseData: exerciseSelected)
        }
        
        
        //if let nav = segue.destination as? UINavigationController, let ExerciseDetailViewController = nav.topViewController as? ExerciseDetailViewController {
          //  ExerciseDetailViewController.delegate = self
        //}
    }
   
}

extension ExerciseViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func configure(tableView: UITableView){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultExercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExerciseViewCell.eRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseViewCell.eIdentifier,
                                                 for: indexPath)
        
            (cell as? ExerciseViewCell)?.update(data: defaultExercises[indexPath.row])
        
        return cell
    }
    
    
}

extension ExerciseViewController: ExerciseDetailDelegate {
    func onDelete(exerciseName: String?) {
        guard let deletedExerciseName = exerciseName else {
            return
        }
        
        removeAll(exerciseName: deletedExerciseName)
       
        
        eTableView.reloadData()
    }
    
    func removeAll(exerciseName: String) {
        var count: Int = 0
        for exercise in defaultExercises {
            if(exercise.name == exerciseName){
                defaultExercises.remove(at: count)
            }
            count += 1
        }
        
    }
}
