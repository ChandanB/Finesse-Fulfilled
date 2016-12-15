//
//  PlayMusicViewController.swift
//  Finesse Fulfilled
//
//  Created by Chandan Brown on 12/14/16.
//  Copyright © 2016 Chandan B. All rights reserved.
//

import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController {

    class ViewController: UIViewController {
        @IBOutlet var trackTitle: UILabel!
        @IBOutlet var playedTime: UILabel!
        
        var audioPlayer = AVAudioPlayer()
        var isPlaying = false
        var timer: Timer!
        
        @IBAction func playOrPauseMusic(sender: AnyObject) {
            if isPlaying {
                audioPlayer.pause()
                isPlaying = false
            } else {
                audioPlayer.play()
                isPlaying = true
                
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            }
        }
        
        @IBAction func stopMusic(sender: AnyObject) {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            isPlaying = false
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            trackTitle.text = "Future Islands - Tin Man"
            let path = Bundle.main.url(forResource: "Future Islands - Tin Man", withExtension: "mp3")
            var error: NSError?
            
            audioPlayer = try AVAudioPlayer(contentsOf: path!) 
                
        }
        
        func updateTime() {
            let currentTime = Int(audioPlayer.currentTime)
            let minutes = currentTime/60
            let seconds = currentTime - minutes * 60
            
            playedTime.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        }
        
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }

}
