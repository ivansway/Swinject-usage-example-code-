//
//  SaveUserInfo.swift
//  SaveUserInfo
//
//  Created by Ivan Myrza on 11.01.2022.
//

import Foundation
import CoreData
import UIKit

class Saver {
    
    public func saveUserInfo(title: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Title", in: context)
        let titleDB = NSManagedObject(entity: entity!, insertInto: context) as! Title
        do {                
            titleDB.title = title
 
            try context.save()
            print("Saved!")
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
