//
//  ViewController.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 04.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDataSource {
    
    var people = [NSManagedObject]()
   
   
   
    @IBOutlet weak var tableView: UITableView!
  
    
    
//    var adj: String!
//    var nom: String!
//    var ver: String!

    var adj = zufallsadj[0]
    var nom = zufallsnom[0]
    var ver = zufallsver[0]
    
   
    
    
    
    @IBAction func addSpruch(sender: UIBarButtonItem) {
    
        // Hier wird der Speichern-Button deaktiviert
        self.navigationItem.rightBarButtonItem?.enabled = false
    
   
    

    
    
        
        self.saveName(adj)
     
        self.tableView.reloadData()
        //println("---->\(adj)\( nom)\( ver)")
        
}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "\"Meine Brainers\""
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
    
    // Hier werden die Zeilen und Zellen deffiniert
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        
        // Hier wird die selbstgemachte Zelle aus TaskCell deffiniert
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let person = people[indexPath.row]
        
        cell.adjLabel.text = person.valueForKey("adjektiv") as String!
        cell.nomLabel.text = person.valueForKey("nomen") as String!
        cell.verLabel.text = person.valueForKey("verb") as String!
       
        
        people.count
        
        return cell
    }

    
    func saveName(String) {
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        person.setValue(adj, forKey: "adjektiv")
        person.setValue(nom, forKey: "nomen")
        person.setValue(ver, forKey: "verb")
        
        
        //4
        var error: NSError?
        
        if !managedContext.save(&error) {println("Could not save \(error) , \(error?.userInfo)")
        }
        //5
        
        people.insert(person, atIndex: 0) //Anstatt append.person --> am Ende dazufügen  --> Jetzt am Anfang
        
        
    }

    
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            
            people = results.reverse() //.reverse() Umgekehrte Anzeige
            
        
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    
    }



    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            return true
       }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
//            if editingStyle == UITableViewCellEditingStyle.Delete {
//            
//            people.removeAtIndex(indexPath.row)
//
//            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            
//            self.tableView.reloadData()
//            
//        }
    
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            let managedContext = appDelegate.managedObjectContext!
                //Das ist swipe to delete
            if editingStyle == UITableViewCellEditingStyle.Delete {
                //Das entfernt entgültig aus CoreDate
                managedContext.deleteObject(people[indexPath.row] as NSManagedObject)
               //Das entfernt es aus dem Table
                people.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
   }

    
    

}






