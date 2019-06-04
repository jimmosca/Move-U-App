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
