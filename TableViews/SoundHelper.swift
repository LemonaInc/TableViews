//
//  SoundHelper.swift
//  Seedlings
//
//  Created by Jonathan Ortheden on 29/08/15.
//  Copyright (c) 2015 Seedlings. All rights reserved.
//

import UIKit
import AVFoundation

extension AnimalsViewController {
        
    func setupAudio() {
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Inspiration", ofType: "mp3")!)
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        let error:NSError?
        try? audioPlayer = AVAudioPlayer(contentsOf: alertSound)
      //  if error == nil {
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        
        }
    }
//}
