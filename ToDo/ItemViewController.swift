//
//  ItemViewController.swift
//  ToDoApp
//
//  Created by Alaysia & Yong on 4/13/19.
//  Copyright © 2019 Alaysia & Yong. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var array = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.rowHeight = 70
    }

    
    @IBAction func addbuttonPressed(_ sender: UIBarButtonItem) {
        let textField = UITextField()
        let popupAlert = UIAlertController(title: "New List Item", message: "Name", preferredStyle: .alert)
        
        // todoey
        
        popupAlert.addTextField { (textfield:UITextField) in textfield.placeholder = "New item"
        }
        popupAlert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (action:UIAlertAction) in
            guard (popupAlert.textFields?.first?.text) != nil else { return }
        let newItem = Category(context: self.context)
        newItem.name = textField.text
        self.array.append(newItem)
            let indexPath = IndexPath(row: self.tableView.numberOfRows(inSection: 0), section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        
        }))
        
        popupAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(popupAlert, animated: true, completion: nil)
    }

    // delete action
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
