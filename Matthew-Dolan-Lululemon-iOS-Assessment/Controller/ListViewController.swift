//
//  ListViewController.swift
//  Matthew-Dolan-Lululemon-iOS-Assessment
//
//  Created by Matt Dolan External macOS on 2021-05-14.
//

import UIKit

class ListViewController: UIViewController {
    
    var garmentModel = GarmentModel()
    
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
        
        // TableView Data Source & Delegate
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.reloadData()
    }
    
    @IBAction func addBarButtonItemPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddScreen", sender: self)
    }
    
    @IBAction func alphaButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func creationTimeButtonPressed(_ sender: UIButton) {
    }
    
    //MARK: - NavigationBarUI
    
    func navigationBarUI() {
        navigationBar.barTintColor = .white
        // TODO: Add Title here and take it out of Attributes inspector
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
        addBarButtonItem.tintColor = .black
    }
    
    //MARK: - ButtonUI
    
    func buttonUI() {
        // alphaButton
        alphaButton.backgroundColor = .white
        alphaButton.layer.borderColor = UIColor.black.cgColor
        alphaButton.layer.borderWidth = 1
        alphaButton.layer.cornerRadius = 10
        alphaButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        alphaButton.setTitle("Alpha", for: .normal)
        alphaButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        alphaButton.setTitleColor(.black, for: .normal)
        
        // creationTimButton
        creationTimeButton.backgroundColor = .white
        creationTimeButton.layer.borderColor = UIColor.black.cgColor
        creationTimeButton.layer.borderWidth = 1
        creationTimeButton.layer.cornerRadius = 10
        creationTimeButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        creationTimeButton.setTitle("Creation Time", for: .normal)
        creationTimeButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        creationTimeButton.setTitleColor(.black, for: .normal)
        
    }
    
    //MARK: - TableView Border
    
    func addTopAndBottomBorder() {
        let thickness: CGFloat = 1.0
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

    //MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentModel.garmentArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        
        cell.textLabel?.text = garmentModel.garmentArray?[indexPath.row]
        
        return cell
    }
}

    //MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

