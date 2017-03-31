//
//  FirstViewController.swift
//  Remnos
//
//  Created by admin on 30/03/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Added a connection
    @IBOutlet weak var outputTable: UITableView!
    
    //declared a empty string array
    var items : [String] = []
    //Added data source functions
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            items.remove(at: indexPath.row)
            outputTable.reloadData()
            UserDefaults.standard.set(items,forKey: "items")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        if let object = itemObjects as? [String]{
            items = object
        }
        outputTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

