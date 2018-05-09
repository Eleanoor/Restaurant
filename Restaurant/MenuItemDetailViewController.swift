//  Minor Programmeren, App Studio
///
//  MenuDetailViewController.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 07-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  View controller for menu item detail. 

import UIKit

class MenuItemDetailViewController: UIViewController {

    // MARK: - Variables
    var delegate: AddToOrderDelegate?
    var menuItem: MenuItem!
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToOderButton: UIButton!
    
    // MARK: - Functions
    /// Function
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()
    }

    /// Function
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.description
        addToOderButton.layer.cornerRadius = 5.0
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
   
    
    /// Function
    func setupDelegate() {
        if let navController = tabBarController?.viewControllers?.last as? UINavigationController,
        let orderTableViewController = navController.viewControllers.first as? OrderTableViewController {
            delegate = orderTableViewController
        }
    }
    
    /// Function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function
    @IBAction func addToOderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOderButton.transform =
                CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOderButton.transform =
                CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        delegate?.added(menuItem: menuItem)
    }
    


}
