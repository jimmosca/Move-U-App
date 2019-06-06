//
//  NutrientViewCell.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class NutrientViewCell: UITableViewCell{
    
    static let nIdentifier = String(describing: NutrientViewCell.self)
    
    static let nRowHeight: CGFloat = 111
    
    @IBOutlet weak var nView: UIView!
    @IBOutlet weak var nNameLabel: UILabel!
    @IBOutlet weak var nFunctionLabel: UILabel!
    @IBOutlet weak var nCaloriesLabel: UILabel!
    @IBOutlet weak var nImageView: UIImageView!
    
    
    override func prepareForReuse() {
        nNameLabel.text = nil
        nFunctionLabel.text = nil
        nCaloriesLabel.text = nil
        nImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure(view: nView)
        
    }
    
    func update(data: Nutrient?){
        update(name: data?.name)
        update(funtion: data?.funtion)
        update(calorieGram: data?.calorieGram)
        update(photo: data?.photo)
    }
    
    private func update(name: String?){
        nNameLabel.text = name
    }
    private func update(funtion: String?){
        nFunctionLabel.text = funtion
    }
    private func update(calorieGram: String?){
        nCaloriesLabel.text = calorieGram
    }
    private func update(photo: String?){
        guard let image = photo else {
            return
        }
        nImageView.image = UIImage(named: image)
    }
}
