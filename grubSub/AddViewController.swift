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
        
        let statusBar = UINavigationBar.appearance()
        // nav bar color => your color
        statusBar.barTintColor = UIColor(red: 43/255.0, green: 79/255.0, blue: 133/255.0, alpha: 1.0)
        statusBar.isTranslucent = false
        // status bar text => white
        statusBar.barStyle = .black
        // nav bar elements color => white
        statusBar.tintColor = .white
        statusBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
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
