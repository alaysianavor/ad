//
//  ViewController.swift
//  Todoey
//
//  Created by Vigneshwar Devendran on 22/03/18.
//  Copyright © 2018 Vigneshwar Devendran. All rights reserved.
//

import UIKit

class TodoeyViewController: UITableViewController {

    
    let array = ["Buy Ethereum","Kill the Chinese","Model a ship"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(array[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

    
}

