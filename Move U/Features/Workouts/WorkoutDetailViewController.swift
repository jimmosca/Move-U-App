//
//  WorkoutDetailViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

protocol WorkoutDetailDelegate {
    func onDelete(workoutName: String?)
}

class WorkoutDetailViewController: UIViewController {
    
    @IBOutlet weak var eCollectionView: UICollectionView!
    
    @IBOutlet weak var wName: UILabel!
    @IBOutlet weak var wLevel: UILabel!
    @IBOutlet weak var wGoal: UILabel!
    
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
    
    private let eCellSpacing: CGFloat = 16.0
    private var selectedWorkout: Workout? = nil
    var delegate: WorkoutDetailDelegate?
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        guard let workout = selectedWorkout else {
            return
        }
        update(data: workout)
        
        eCollectionView.reloadData()
    }
    func set(workoutData: Workout){
        selectedWorkout = workoutData
    }
    
    private func configureCollectionView() {
        eCollectionView.delegate = self
        eCollectionView.dataSource = self
    }
    
    private func update(data: Workout) {
        update(name: data.name)
        update(level: data.level)
        update(goal: data.goal)
        
    }
    
    private func update(name: String?) {
        wName.text = name
    }
    
    private func update(level: String?) {
        wLevel.text = level
    }
    
    private func update(goal: String?) {
        wGoal.text = goal
    }
    
    private func navigateBack() {
        
        delegate?.onDelete(workoutName: selectedWorkout?.name)
       
        navigationController?.popViewController(animated: true)
    }
    
}


extension WorkoutDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedWorkout?.exercises?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutDetailExerciseViewCell.eIdentifier,
                                                      for: indexPath) as! WorkoutDetailExerciseViewCell
        if let workout = selectedWorkout?.exercises?[indexPath.row] {
            cell.configureCell(data: workout)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size - eCellSpacing,
                      height: size - eCellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return eCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return eCellSpacing
    }
}

