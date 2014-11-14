//
//  FirstViewController.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 05.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//



import UIKit

class FirstViewController: UIViewController {
    
    //self.navigationController.navigationBarHidden = true
    
    
    @IBOutlet weak var adjektivLabel: UILabel!
    
  
    @IBOutlet weak var nomenLabel: UILabel!
    
    
    @IBOutlet weak var verbLabel: UILabel!
    
    
   
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   // Hier wird der Speichern-Butten ausgegraut
    self.navigationItem.rightBarButtonItem?.enabled = false
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func BrainFXButtonTapped(sender: AnyObject) {
   
   // Hier wird der Speichern-Button aktiviert
   self.navigationItem.rightBarButtonItem?.enabled = true
    
        
        let zufallszahlAdjektiv = Int(arc4random_uniform(UInt32(countAdjektiv)))
        let zufallsAdjektiv = adjektiv[zufallszahlAdjektiv]
        adjektivLabel.text = zufallsAdjektiv
        zufallsadj[0] = adjektivLabel.text!
        var a = zufallsadj[0]
        
        let zufallszahlNomen = Int(arc4random_uniform(UInt32(countNomen)))
        let zufallsNomen = nomen[zufallszahlAdjektiv]
        nomenLabel.text = zufallsNomen
        zufallsnom[0] = nomenLabel.text!
        var b = zufallsnom[0]
        
        let zufallszahlVerb = Int(arc4random_uniform(UInt32(countVerben)))
        let zufallsVerb = verben[zufallszahlVerb]
        verbLabel.text = zufallsVerb
        zufallsver[0] = verbLabel.text!
        var c = zufallsver[0]
        
        println("->\(zufallsAdjektiv)\( zufallsNomen)\( zufallsVerb)")
        println("-->\(a)\(b)\(c)")
        
    }
    //Neu
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "segueTest") {
//            var tableVC = segue.destinationViewController as TableViewController;
//            tableVC.adj = adjektivLabel.text
//            tableVC.nom = nomenLabel.text
//            tableVC.ver = verbLabel.text
//        }
//    
//    
//    }
//    
    
    
    
    
    
    
    //Alt!!
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        let theDestination = (segue.destinationViewController as TableViewController)
//        
//        //theDestination.
//        
//        let adj = adjektivLabel.text!
//        let nom = nomenLabel.text!
//        let ver = verbLabel.text!
//        
//        println()
//        
//    }
    
    
}

