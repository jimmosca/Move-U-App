//
//  NutrientDetailViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit


protocol NutrientDetailDelegate {
    func onDelete(nutrientName: String?)
}

class NutrientDetailViewController: UIViewController {
    
    @IBOutlet weak var eNutrientName: UILabel!
    @IBOutlet weak var eNutrientFunction: UILabel!
    @IBOutlet weak var eNutrientRecomended: UILabel!
    @IBOutlet weak var eNutrientCalories: UILabel!
    
    @IBOutlet weak var eNutrientImage: UIImageView!
    
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Borrar nutriente",
                                      message: "Al borrar este nutriente no podrás volver a acceder a él.¿Estas seguro de querer continuar?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        // add buttons
        alert.addAction(UIAlertAction(title: "Continuar",
                                      style: UIAlertActionStyle.destructive,
                                      handler: { action in
                                        self.navigateBack();
        }))
        alert.addAction(UIAlertAction(title: "Cancelar",
                                      style: UIAlertActionStyle.cancel,
                                      handler: nil))
        // show alert
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    var delegate: NutrientDetailDelegate?
    private var nutrientData: Nutrient? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let nutrient = nutrientData else {
            return
        }
        update(data: nutrient)
    }
    
    func set(nutrientData: Nutrient) {
        self.nutrientData = nutrientData
    }
    
    
    private func update(data: Nutrient) {
        update(name: data.name)
        update(function: data.funtion)
        update(recomended: data.recomendedQty)
        update(calories: data.calorieGram)
        update(photo: data.photo)
    }
    
    private func update(name: String?) {
        eNutrientName.text = name
    }
    
    private func update(function: String?) {
        eNutrientFunction.text = function
    }
    
    private func update(recomended: String?) {
        eNutrientRecomended.text = recomended
    }
    
    private func update(calories: String?) {
        eNutrientCalories.text = calories
    }
    
    private func update(photo: String?) {
        guard let image = photo else {
            return
        }
        eNutrientImage.image = UIImage(named: image)
    }
    
    private func navigateBack() {
        // Llamamos al metodo borrar del delegado asociado
        delegate?.onDelete(nutrientName: nutrientData?.name)
        // Llamamos al metodo, adecuado para el tipo de navegacion, para volver a la pantalla anterior
        navigationController?.popViewController(animated: true)
    }
    
}
