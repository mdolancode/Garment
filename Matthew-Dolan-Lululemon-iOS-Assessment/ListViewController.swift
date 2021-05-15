//
//  ListViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-14.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var creationTimeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUI()
        buttonUI()
        addTopAndBottomBorder()
    }
    
    @IBAction func addBarButtonItemPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func alphaButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func creationTimeButtonPressed(_ sender: UIButton) {
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        addBarButtonItem.tintColor = .black
    }
    
    //MARK: - ButtonUI
    
    func buttonUI() {
        // alphaButton
        alphaButton.backgroundColor = .red
        alphaButton.layer.borderColor = UIColor.black.cgColor
        alphaButton.layer.borderWidth = 1
        alphaButton.layer.cornerRadius = 10
        alphaButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        // creationTimButton
        creationTimeButton.backgroundColor = .red
        creationTimeButton.layer.borderColor = UIColor.black.cgColor
        creationTimeButton.layer.borderWidth = 1
        creationTimeButton.layer.cornerRadius = 10
        creationTimeButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
     
    }
    
    //MARK: - TableView Border
    
    func addTopAndBottomBorder() {
        let thickness: CGFloat = 2.0
        let topBorder = CALayer()
        let bottomBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.size.width, height: thickness)
        topBorder.backgroundColor = UIColor.black.cgColor
        bottomBorder.frame = CGRect(x: 0.0, y: self.tableView.frame.size.height - thickness, width: self.tableView.frame.size.width, height: thickness)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        tableView.layer.addSublayer(topBorder)
        tableView.layer.addSublayer(bottomBorder)
    }
}

