//
//  NutrientFormViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 6/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//


import UIKit

class NutrientFormViewController: UIViewController {
    
    @IBOutlet weak var nNameText: UITextField!
    @IBOutlet weak var nRecommendedText: UITextField!
    @IBOutlet weak var nFunctionText: UITextField!
    @IBOutlet weak var nCaloriesText: UITextField!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Guardar nutriente",
                                      message: "Deseas continuar añadiendo el elemento especificado?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        // add buttons
        alert.addAction(UIAlertAction(title: "Continuar",
                                      style: UIAlertActionStyle.default,
                                      handler: { action in
                                        self.saveNutrient();
        }))
        alert.addAction(UIAlertAction(title: "Cancelar",
                                      style: UIAlertActionStyle.cancel,
                                      handler: nil))
        // show alert
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func saveNutrient(){
        guard let caloriesText = nCaloriesText.text else {
            return
        }
        defaultNutrients.append(Nutrient(name: nNameText.text, funtion: nFunctionText.text, recomendedQty: nRecommendedText.text, calorieGram: Int(caloriesText)))
        dismiss(animated: true, completion: nil)
    }
}
