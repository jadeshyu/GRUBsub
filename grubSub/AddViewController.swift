//
//  AddViewController.swift
//  grubSub
//
//  Created by Jade S on 12/2/17.
//  Copyright © 2017 Jade S. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var chooseFood: UITextField!
    
    @IBOutlet var servingNumber: UITextField!
    
    let pickFood = UIPickerView()
    let pickServing = UIPickerView()
    
    var food = ["Fried chicken", "Grilled chicken", "Lettuce", "White bread"]
    
    var serving = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("loaded")
        
        chooseFood.inputView = pickFood
        servingNumber.inputView = pickServing
        
        pickFood.delegate = self
        pickServing.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    //close modal
    @IBAction func closeView(_ sender: Any) {
        
        print("pressed close")
        
        dismiss (animated: true, completion: nil)
    }
    
    @IBAction func confirm(_ sender: Any) {
        
        let foodObject = UserDefaults.standard.object(forKey: "foods")
        
        var food:[String]
        
        //add on existing to array
        if let tempFood = foodObject as? [String] {
            
            food = tempFood
            
            food.append(chooseFood.text!)
            
            print(food)
            
        } else {
            //add on new array
            food = [chooseFood.text!]
        }
        
        UserDefaults.standard.set(food, forKey: "foods")
        
        //chooseFood.text = ""
        
        print(chooseFood.text!)
        
        dismiss (animated: true, completion: nil)
        
    }

    //number of selected rows in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows : Int = food.count
        
        if pickerView == pickServing {
            countRows = self.serving.count
        }
        
        return countRows
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickFood {
            let titleRow = food[row]
            return titleRow
        }
        
        else if pickerView == pickServing {
            let titleRow = serving[row]
            return String(titleRow)
        }
        
    return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickFood {
            self.chooseFood.text = self.food[row]
        }
        
        else if pickerView == pickServing {
            self.servingNumber.text = String(self.serving[row])
        }
        
        self.view.endEditing(true) 
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == self.chooseFood {
            self.pickFood.isHidden = false
            pickFood.endEditing(true)
        }
        
        else if textField == servingNumber {
            self.pickServing.isHidden = false
            pickServing.endEditing(true)
        }
    }


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
