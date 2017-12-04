//
//  ViewController.swift
//  grubSub
//
//  Created by Jade S on 12/2/17.
//  Copyright © 2017 Jade S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet var table: UITableView!

    var food: [String] = []

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return food.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        print(indexPath)
        
        cell.textLabel?.text = food[indexPath[1]]
        
        return cell
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let foodObject = UserDefaults.standard.object(forKey: "foods")
        
        print("Tis is itemsObject")
        print(foodObject)
        
        //add on existing to array
        if let tempItems = foodObject as? [String] {
            
            food = tempItems
            
            print("Tis is tempItem")
            print(tempItems)
        }
        
        table.reloadData()
        
        print("bakkk first page")
        print(food)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

