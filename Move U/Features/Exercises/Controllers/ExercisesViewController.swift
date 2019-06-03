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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(tableView: eTableView)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseViewCell.eIdentifier,
                                                 for: indexPath)
        
            (cell as? ExerciseViewCell)?.update(data: defaultExercises[indexPath.row])
        
        return cell
    }
    
    
}
