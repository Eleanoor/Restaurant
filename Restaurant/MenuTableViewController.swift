//  Minor Programmeren, App Studio
//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 07-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Table View for Menu.

import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: - Variables
    var menuItems = [MenuItem]()
    var category: String!
    
    // MARK: - Functions
    
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
        MenuController.shared.fetchMenuItems(categoryName: category) {
            (menuItems) in
            if let menuItems = menuItems {
                self.updateUI(with: menuItems)
            }
        }
    }
    
    ///
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
        self.menuItems = menuItems
        self.tableView.reloadData()
        }
    }

    ///
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    ///
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }

    ///
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell),
                    currentIndexPath != indexPath {
                    return
                }
                cell.imageView?.image = image
            }
        }
    }
    
    ///
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
