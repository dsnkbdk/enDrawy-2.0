//
//  RegisterViewController.swift
//  enDrawy! 2.0
//
//  Created by WENNAN SHI on 5/4/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import UIKit
import CoreData
import AudioToolbox

class RegisterViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    var user: [NSManagedObject] = []
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var occupationField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var usernameValidation: UILabel!
    @IBOutlet weak var passwordValidation: UILabel!
    
    let occupationData = ["Actor", "Business", "Director", "Doctor", "Engineer", "HR", "IT", "Sales", "Student", "Teacher"]
    let genderData = ["Male", "Female", "Secret"]
    let ageData = ["10-17", "18-25", "26-35", "36-45", "46-55", "55+"]
    
    let occupationPicker = UIPickerView()
    let genderPicker = UIPickerView()
    let agePicker = UIPickerView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        occupationPicker.delegate = self
        occupationPicker.dataSource = self
        genderPicker.delegate = self
        genderPicker.dataSource = self
        agePicker.delegate = self
        agePicker.dataSource = self

        occupationField.inputView = occupationPicker
        genderField.inputView = genderPicker
        ageField.inputView = agePicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView
        {
        case occupationPicker:
            return self.occupationData.count
        case genderPicker:
            return self.genderData.count
        case agePicker:
            return self.ageData.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == occupationPicker
        {
            let titleRow = self.occupationData[row]
            return titleRow
        }
        else if pickerView == genderPicker
        {
            let titleRow = self.genderData[row]
            return titleRow
        }
        else if pickerView == agePicker
        {
            let titleRow = self.ageData[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == occupationPicker
        {
            self.occupationField.text = self.occupationData[row]
        }
        else if pickerView == genderPicker
        {
            self.genderField.text = self.genderData[row]
        }
        else if pickerView == agePicker
        {
            self.ageField.text = self.ageData[row]
        }
    }
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func isValidPassword(_ password: String?) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{6,}$")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func Save(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        if usernameField.text != "" && passwordField.text != "" && occupationField.text != "" && genderField.text != "" && ageField.text != ""
        {
            if isValidPassword(passwordField.text) == false
            {
                let alertVC = UIAlertController(title: "Notice", message: "Password Verification Fails", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertVC, animated: true)
            }
            
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
            newUser.setValue(self.usernameField.text, forKey: "username")
            newUser.setValue(self.passwordField.text, forKey: "password")
            newUser.setValue(self.occupationField.text, forKey: "occupation")
            newUser.setValue(self.genderField.text, forKey: "gender")
            newUser.setValue(self.ageField.text, forKey: "age")
            
            do {
                try context.save()
            } catch {
                print(error)
            }
            
            let alertVC = UIAlertController(title: "Notice", message: "Registration Successful", preferredStyle: .alert)
            let acSure = UIAlertAction(title: "Login Now", style: .default)
            {
                (UIAlertAction) -> Void in self.performSegue(withIdentifier: "toLogin", sender: self)
            }
            alertVC.addAction(acSure)
            self.present(alertVC, animated: true)
        }
        
        else
        {
            let alertVC = UIAlertController(title: "Notice", message: "Please Fill in All Blanks", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertVC, animated: true)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == self.usernameField
        {
            usernameField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        else if textField == self.passwordField
        {
            passwordField.resignFirstResponder()
            occupationField.becomeFirstResponder()
        }
        return true
    }
}
