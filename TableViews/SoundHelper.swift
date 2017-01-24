//
//  SoundHelper.swift
//  TableViews
//
//   Jaxon Stevens on 1/17/17.
//   Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import AVFoundation

extension WestViewController {
        
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
