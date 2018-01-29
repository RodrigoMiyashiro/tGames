//
//  DeleteData.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 28/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import CoreData

class DeleteData: NSObject
{
    let managedContext = DataManager().persistentContainer.viewContext
    
    func ListGameDB()
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListGameDB")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do
        {
            try managedContext.execute(batchDeleteRequest)
        }
        catch
        {
            print("-->> Error delete List Game DB")
        }
    }
}
