//
//  LoginViewController.swift
//  enDrawy! 2.0
//
//  Created by WENNAN SHI on 5/2/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import UIKit
import CoreData
import AudioToolbox

class LoginViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var verification: Bool = false
    
    @IBAction func signUp(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
    }
    
    @IBAction func login(_ sender: Any)
    {
        AudioServicesPlaySystemSound(1104)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            if result.count > 0
            {
                for result in result as! [NSManagedObject]
                {
                    if usernameField.text == result.value(forKey: "username") as? String && passwordField.text == result.value(forKey: "password") as? String
                    {
                        verification = true
                        let alertVC = UIAlertController(title: "Notice", message: "Login Successfully", preferredStyle: .alert)
                        let acSure = UIAlertAction(title: "enDrawy! Now", style: .default)
                        {
                            (UIAlertAction) -> Void in self.performSegue(withIdentifier: "toDraw", sender: self)
                        }
                        alertVC.addAction(acSure)
                        self.present(alertVC, animated: true)
                    }
                    else
                    {
                        verification = false
                        print("error")
                    }
                }
            }
        }
        catch
        {
            
        }
        if verification == false
        {
            let alertVC = UIAlertController(title: "Notice", message: "Wrong Username or Password", preferredStyle: .alert)
            let acSure = UIAlertAction(title: "OK", style: .default)
            alertVC.addAction(acSure)
            self.present(alertVC, animated: true)
        }
    }
    
    @IBAction func toDraw(_ sender: UIButton)
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
        else
        {
            passwordField.resignFirstResponder()
        }
        return true
    }
    

    
    
}
