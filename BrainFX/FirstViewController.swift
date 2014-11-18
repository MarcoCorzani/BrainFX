//
//  FirstViewController.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 05.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//



import UIKit

class FirstViewController: UIViewController {
    
  

    
    
    
    @IBOutlet weak var adjektivLabel: UILabel!
    
  
    @IBOutlet weak var nomenLabel: UILabel!
    
    
    @IBOutlet weak var verbLabel: UILabel!
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Hier wird der Speichern-Butten ausgegraut
        self.navigationItem.rightBarButtonItem?.enabled = false
    
        // Hier wird der Switch optisch verändert
        mySwitch.onTintColor = UIColor(red: 0.291, green: 0.6946, blue: 0.6036, alpha: 1.0)
        mySwitch.setOn(false, animated: false)
    
        
    }
    
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    
    
    @IBAction func BrainFXButtonTapped(sender: AnyObject) {
        
        //Gibt den Ton aus Sound.swift wieder
        
        if mySwitch.on {
        
        ton()
        
        }
        
        
        
        
        
        // Hier wird der Speichern-Button aktiviert, sobald der erste Spruch kreiert wird
        self.navigationItem.rightBarButtonItem?.enabled = true
    
        
        let zufallszahlAdjektiv = Int(arc4random_uniform(UInt32(countAdjektiv)))
        let zufallsAdjektiv = adjektiv[zufallszahlAdjektiv]
        adjektivLabel.text = zufallsAdjektiv

        
        let zufallszahlNomen = Int(arc4random_uniform(UInt32(countNomen)))
        let zufallsNomen = nomen[zufallszahlNomen]
        nomenLabel.text = zufallsNomen

        
        let zufallszahlVerb = Int(arc4random_uniform(UInt32(countVerben)))
        let zufallsVerb = verben[zufallszahlVerb]
        verbLabel.text = zufallsVerb
    }

   
    
    
    // Nächster viewController ist der NavigationConroller, deshalb UINavigationController!!!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "meineBrainer"{
            let navigationController = segue.destinationViewController as UINavigationController
            
            let vc = navigationController.viewControllers[0] as TableViewController
            vc.test = "brainer"
            
        }
        
        if segue.identifier == "brainerSpeichern"{
            let navigationController = segue.destinationViewController as UINavigationController
            
            let vc = navigationController.viewControllers[0] as TableViewController
            vc.adj = adjektivLabel.text!
            vc.nom = nomenLabel.text!
            vc.ver = verbLabel.text!
            
        }
    }
    

}

