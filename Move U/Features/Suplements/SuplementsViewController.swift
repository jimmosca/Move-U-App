//
//  SuplementsViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 7/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class SuplementsViewController: UIViewController {

    @IBOutlet weak var sCollectionView: UICollectionView!
    
    private let sCellSpacing: CGFloat = 8.0
    
    private var sIndice: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        sCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let collectionViewCell = sender as? UICollectionViewCell,
            let indexPath = sCollectionView.indexPath(for: collectionViewCell) else {
                return
        }
        
        let suplementSelected = defaultSuplements[indexPath.row]
        sIndice = indexPath.row
        if let destinationViewController = segue.destination as? SuplementDetailViewController{
            // Especificas que esta clase es el delegate del DetailView
            destinationViewController.delegate = self
            destinationViewController.set(suplementData: suplementSelected)
        }
        
    }
    
    private func configureCollectionView() {
        sCollectionView.delegate = self
        sCollectionView.dataSource = self
    }
    
}

extension SuplementsViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultSuplements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuplementViewCell.sIdentifier,
                                                      for: indexPath) as! SuplementViewCell
         let suplement = defaultSuplements[indexPath.row]
            cell.update(data: suplement)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size - sCellSpacing,
                      height: size - sCellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sCellSpacing
    }
    
}

extension SuplementsViewController: SuplementDetailDelegate{
    func onDelete() {
        guard let indice = sIndice else {
            return
        }
        defaultSuplements.remove(at: indice)
        sCollectionView.reloadData()
    }
}
