//
//  WorkoutViewCell.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class WorkoutViewCell: UITableViewCell{
    
    static let wIdentifier = String(describing: WorkoutViewCell.self)
    
    static let wRowHeight: CGFloat = 210.0
    
    @IBOutlet weak var wView: UIView!
    @IBOutlet weak var wNameLabel: UILabel!
    @IBOutlet weak var wLevelLabel: UILabel!
    @IBOutlet weak var wGoalLabel: UILabel!
    @IBOutlet weak var wImageView: UIImageView!
    
    
    override func prepareForReuse() {
        wNameLabel.text = nil
        wLevelLabel.text = nil
        wGoalLabel.text = nil
        wImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(view: wView)
    }
    
    func update(data: Workout?){
        update(name: data?.name)
        update(level: data?.level)
        update(goal: data?.goal)
        update(photo: data?.photo)
    }
    
    private func update(name: String?){
        wNameLabel.text = name
    }
    private func update(level: String?){
        wLevelLabel.text = level
    }
    private func update(goal: String?){
        wGoalLabel.text = goal
    }
    private func update(photo: String?){
        guard let image = photo else {
            return
        }
        wImageView.image = UIImage(named: image)
    }
}
