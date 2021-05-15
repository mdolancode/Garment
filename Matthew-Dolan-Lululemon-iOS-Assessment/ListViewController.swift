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
        alphaButton.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        // creationTimButton
        creationTimeButton.backgroundColor = .black
        creationTimeButton.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
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

    //MARK: - UIButton

extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

