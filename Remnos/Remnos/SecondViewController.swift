//
//  SecondViewController.swift
//  Remnos
//
//  Created by admin on 30/03/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func inputAction(_ sender: AnyObject) {
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        print(itemObjects)
        if let checkObjects = itemObjects as? [String]{
            items = checkObjects
            items.append(inputText.text!)
            
        }
        else{
            items = [inputText.text!]
        }
        inputText.text = ""
        UserDefaults.standard.set(items, forKey: "items")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Minimize the keyboard if the user presse out of the keyboard section
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

