//
//  ExerciseViewCell.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class ExerciseViewCell: UITableViewCell{
    
    static let eIdentifier = String(describing: ExerciseViewCell.self)
    
    static let eRowHeight: CGFloat = 210.0
    
    @IBOutlet weak var eView: UIView!
    @IBOutlet weak var eNameLabel: UILabel!
    @IBOutlet weak var eAreaLabel: UILabel!
    @IBOutlet weak var eDificultyLabel: UILabel!
    @IBOutlet weak var eImageView: UIImageView!
    
    
    override func prepareForReuse() {
        eNameLabel.text = nil
        eAreaLabel.text = nil
        eDificultyLabel.text = nil
        eImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure(view: eView)
        
    }
    
    func update(data: Exercise?){
        update(name: data?.name)
        update(area: data?.area)
        update(dificulty: data?.dificulty)
        update(photo: data?.photo)
    }
    
    private func update(name: String?){
        eNameLabel.text = name
    }
    private func update(area: String?){
        eAreaLabel.text = area
    }
    private func update(dificulty: String?){
        eDificultyLabel.text = dificulty
    }
    private func update(photo: String?){
        guard let image = photo else {
            return
        }
        eImageView.image = UIImage(named: image)
    }
}
