//
//  AddViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-15.
//

import UIKit

class AddGarmentViewController: UIViewController {
    
    var delegate: AddGarmentDelegate?
    
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
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let garmentName = addGarmentTextField.text, addGarmentTextField.hasText else {
            
            print("Handle error")
            return
        }
        
        
        let garment = Garment(garmentName: garmentName)
        
        delegate?.addGarment(garment)
        
        print(garment.garmentName)
        
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        // TODO: Add Title here and take it out of Attributes inspector
        //        navigationItem.title = "Add"
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        saveBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 18)!], for: .normal)
    }
    
    //MARK: - GarmentLabelUI
    
    func garmentLabelUI() {
        garmentNameLabel.font = UIFont(name: "MarkerFelt-Thin", size: 24)
        garmentNameLabel.text = "Garment Name:"
    }
    
    //MARK: - UITextField
    
    func textFieldUI() {
        addGarmentTextField.clearButtonMode = .whileEditing
        addGarmentTextField.layer.borderWidth = 1
        addGarmentTextField.layer.borderColor = UIColor.black.cgColor
        addGarmentTextField.font = UIFont(name: "MarkerFelt-Thin", size: 16)
    }
}
