//
//  AddViewController.swift
//  Garment
//
//  Created by Matt Dolan External macOS on 2021-05-15.
//

import UIKit

class AddGarmentViewController: UIViewController {
    
    var dependencies = Dependencies.shared

    weak var delegate: PersistenceEventDelegate?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var garmentNameLabel: UILabel!
    @IBOutlet weak var addGarmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        textFieldUI()
        garmentLabelUI()
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        
        navigationBar.topItem?.title = "Add"
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        
        saveBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 18)!], for: .normal)
        
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationBar.layer.shadowOpacity = 1.0
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationBar.layer.shadowRadius = 0.1
    }
    
    //MARK: - GarmentLabelUI
    
    func garmentLabelUI() {
        garmentNameLabel.font = UIFont(name: "MarkerFelt-Thin", size: 24)
        garmentNameLabel.text = "Garment Name:"
    }
    
    //MARK: - UITextField
    
    func textFieldUI() {
        addGarmentTextField.clearButtonMode = .whileEditing
        addGarmentTextField.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        addGarmentTextField.layer.borderWidth = 1
        addGarmentTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    //MARK: - SaveButton
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let garmentName = addGarmentTextField.text, addGarmentTextField.hasText else {
            print("Error adding garment.")
            return
        }
        
        let dateCreated = Date()
        let garmentData = GarmentData(garmentName: garmentName, dateCreated: dateCreated)
        
        if dependencies.database.saveData(garment: garmentData) {
            delegate?.didSaveData()
        }
    }
}
