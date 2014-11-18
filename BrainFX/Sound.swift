//
//  Sound.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 15.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import AVFoundation
import UIKit
import AudioToolbox

var audioPlayer: AVAudioPlayer?




func ton() {

if let path = NSBundle.mainBundle().pathForResource("sonar", ofType: "wav") {
    
    audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "wav", error: nil)
    
    
    
    if let sound = audioPlayer {
        
        
        
        sound.prepareToPlay()
        
        sound.play()
    }
    
}

}