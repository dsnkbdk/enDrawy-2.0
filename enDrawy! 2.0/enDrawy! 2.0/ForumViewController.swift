//
//  ForumViewController.swift
//  enDrawy! 2.0
//
//  Created by WENNAN SHI on 5/11/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import UIKit
import CoreData
import AudioToolbox

class ForumViewController: UIViewController, UITextFieldDelegate
{
    var comment: [NSManagedObject] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var inputComment: UITextView!
    
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        AudioServicesPlaySystemSound(1104)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem)
    {
        AudioServicesPlaySystemSound(1104)
        if inputComment.text != ""
        {
            let newComment = NSEntityDescription.insertNewObject(forEntityName: "Forum", into: context)
            newComment.setValue(self.inputComment.text, forKey: "comment")
            
            do {
                try context.save()
            } catch {
                print(error)
            }
            
            let alertVC = UIAlertController(title: "Notice", message: "Comments Submitted", preferredStyle: .alert)
            let acSure = UIAlertAction(title: "Done", style: .default)
            alertVC.addAction(acSure)
            self.present(alertVC, animated: true)
        }
            
        else
        {
            let alertVC = UIAlertController(title: "Notice", message: "Please Give some Comments", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertVC, animated: true)
        }
    }

}

class CommentsView: UITableView
{
    
}
