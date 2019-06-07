//
//  SuplementViewCell.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 7/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class SuplementViewCell: UICollectionViewCell{
    
    static let sIdentifier = String(describing: SuplementViewCell.self)
    
    @IBOutlet weak var sImageView: UIImageView!
    @IBOutlet weak var sNameLabel: UILabel!
    
    
    override func prepareForReuse() {
        sImageView?.image = nil
        sNameLabel?.text = ""
    }
    
    func update(data: Suplement) {
        update(name: data.name)
        update(image: data.photo)
    }
    
    private func update(name: String?) {
        sNameLabel?.text = name
    }
    
    private func update(image: String?) {
        guard let photo = image else {
            return
        }
        sImageView?.image = UIImage(named: photo)
    }
    
}
