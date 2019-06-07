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
    
    private var eIndice: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable(tableView: eTableView)
        eTableView.reloadData()
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableViewCell = sender as? UITableViewCell,
            let indexPath = eTableView.indexPath(for: tableViewCell) else {
                return
        }
        
        let exerciseSelected = defaultExercises[indexPath.row]
        eIndice = indexPath.row
        if let destinationViewController = segue.destination as? ExerciseDetailViewController{
            // Especificas que esta clase es el delegate del DetailView
            destinationViewController.delegate = self
            destinationViewController.set(exerciseData: exerciseSelected)
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eTableView.reloadData()
    }
   
}

extension ExerciseViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func configureTable(tableView: UITableView){
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
// Implementamos el Delegado del DetailView
extension ExerciseViewController: ExerciseDetailDelegate {
    func onDelete() {
        
            guard let indice = eIndice else {
                return
            }
            defaultExercises.remove(at: indice)
            eTableView.reloadData()
       
        
    }
    
    
}
