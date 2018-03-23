//
//  ViewController.swift
//  Todoey
//
//  Created by Vigneshwar Devendran on 22/03/18.
//  Copyright © 2018 Vigneshwar Devendran. All rights reserved.
//

import UIKit

class TodoeyViewController: UITableViewController {

    
    var array = [TodoeyModel]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        let newItem = TodoeyModel()
        newItem.title = "Buy Ethereum"
        array.append(newItem)
        
        let newItem2 = TodoeyModel()
        newItem2.title = "Open citibank account"
        array.append(newItem2)
        
        let newItem3 = TodoeyModel()
        newItem3.title = "Get Passport"
        array.append(newItem3)
        if let items = defaults.array(forKey: "TodoListArray") as? [TodoeyModel] {
            array = items
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row].title
        
        cell.accessoryType = array[indexPath.row].done == true ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return array.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        array[indexPath.row].done = !array[indexPath.row].done
        print(array[indexPath.row])
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add new", style: .default) { (action) in
            let newItem = TodoeyModel()
            newItem.title = textField.text!
            self.array.append(newItem)
            self.defaults.set(self.array, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

