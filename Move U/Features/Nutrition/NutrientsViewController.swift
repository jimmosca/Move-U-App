//
//  NutrientsViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

class NutrientsViewController: UIViewController {
    
    @IBOutlet weak var nTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(tableView: nTableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableViewCell = sender as? UITableViewCell,
            let indexPath = nTableView.indexPath(for: tableViewCell) else {
                return
        }
        
        let nutrientSelected = defaultNutrients[indexPath.row]
        
        if let destinationViewController = segue.destination as? NutrientDetailViewController{
            // Especificas que esta clase es el delegate del DetailView
            destinationViewController.delegate = self
            destinationViewController.set(nutrientData: nutrientSelected)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nTableView.reloadData()
    }
    
}

extension NutrientsViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func configure(tableView: UITableView){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultNutrients.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NutrientViewCell.nRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NutrientViewCell.nIdentifier,
                                                 for: indexPath)
        
        (cell as? NutrientViewCell)?.update(data: defaultNutrients[indexPath.row])
        
        return cell
    }
    
}

extension NutrientsViewController: NutrientDetailDelegate{
    func onDelete(nutrientName: String?) {
        guard let deletedNutrientName = nutrientName else {
            return
        }
        
        // Creacion de array solo con los nombres
        let aux = defaultNutrients.compactMap{ $0.name }
        // Obtener el index del nombre que es pasado por parametro
        let indice = aux.index(of: deletedNutrientName)
        if let index = indice {
            // Se borra de la coleccion original el elemento que tiene ese index, ya que coinciden
            defaultNutrients.remove(at: index)
            nTableView.reloadData()
        }
    }
    
    
}
