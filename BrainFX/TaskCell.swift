//
//  TaskCell.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 05.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    
    
    @IBOutlet weak var adjLabel: UILabel!
   
    
    @IBOutlet weak var nomLabel: UILabel!
    
    
    @IBOutlet weak var verLabel: UILabel!
    
   
   
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
