//
//  WorkoutsViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 4/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController {
    
    @IBOutlet weak var wTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(tableView: wTableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableViewCell = sender as? UITableViewCell,
            let indexPath = wTableView.indexPath(for: tableViewCell) else {
                return
        }
        
        let exerciseSelected = defaultWorkouts[indexPath.row]
        
        if let destinationViewController = segue.destination as? WorkoutDetailViewController{
            // Especificas que esta clase es el delegate del DetailView
            destinationViewController.delegate = self
            destinationViewController.set(workoutData: exerciseSelected)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wTableView.reloadData()
    }
    
}

extension WorkoutsViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func configure(tableView: UITableView){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WorkoutViewCell.wRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutViewCell.wIdentifier,
                                                 for: indexPath)
        
        (cell as? WorkoutViewCell)?.update(data: defaultWorkouts[indexPath.row])
        
        return cell
    }
    
    
}

extension WorkoutsViewController: WorkoutDetailDelegate{
    func onDelete(workoutName: String?) {
        guard let deletedWorkoutName = workoutName else {
            return
        }
        
        // Creacion de array solo con los nombres
        let aux = defaultWorkouts.compactMap{ $0.name }
        // Obtener el index del nombre que es pasado por parametro
        let indice = aux.index(of: deletedWorkoutName)
        if let index = indice {
            // Se borra de la coleccion original el elemento que tiene ese index, ya que coinciden
            defaultWorkouts.remove(at: index)
            wTableView.reloadData()
        }
    }
    
}
