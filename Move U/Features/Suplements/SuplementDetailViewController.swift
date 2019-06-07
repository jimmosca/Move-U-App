//
//  SuplementDetailViewController.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 7/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import UIKit

protocol SuplementDetailDelegate {
    func onDelete()
}

class SuplementDetailViewController: UIViewController {
    
    @IBOutlet weak var sSuplementName: UILabel!
    @IBOutlet weak var sSuplementPrice: UILabel!
    @IBOutlet weak var sSuplementUsage: UILabel!
    @IBOutlet weak var sSuplementWhen: UILabel!
    
    
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        // create alert
        let alert = UIAlertController(title: "Borrar suplemento",
                                      message: "Al borrar este suplemento no podrás volver a acceder a él.¿Estas seguro de querer continuar?",
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
    
    
    var delegate: SuplementDetailDelegate?
    private var suplementData: Suplement? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let suplement = suplementData else {
            return
        }
        update(data: suplement)
    }
    
    func set(suplementData: Suplement) {
        self.suplementData = suplementData
    }
    
    
    private func update(data: Suplement) {
        update(name: data.name)
        update(price: data.price)
        update(usage: data.usage)
        update(whenToUse: data.whenToUse)
    }
    
    private func update(name: String?) {
        sSuplementName.text = name
    }
    
    private func update(price: Double?) {
        guard let money = price else {
            return
        }
        sSuplementPrice.text = String(format: "%.2f", money) + "€"
    }
    
    private func update(usage: String?) {
        sSuplementUsage.text = usage
    }
    
    private func update(whenToUse: String?) {
        sSuplementWhen.text = whenToUse
    }
    
    private func navigateBack() {
        // Llamamos al metodo borrar del delegado asociado
        delegate?.onDelete()
        // Llamamos al metodo, adecuado para el tipo de navegacion, para volver a la pantalla anterior
        navigationController?.popViewController(animated: true)
    }
    
}
