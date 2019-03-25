//
//  ViewController.swift
//  MRadio
//
//  Created by Larissa on 2019-03-25.
//  Copyright © 2019 Larissa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVPlayer?
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://985-lh.akamaihd.net/i/studioaudio_1@393647/master.m3u8") {
                player = AVPlayer(url: url)
        }
        enablePlayback()
    }

    @IBAction func playTouchUpInside(_ sender: Any) {
        let button = sender as! UIButton
        if(!isPlaying) {
            player?.play()
            button.setImage(UIImage(named: "pause"), for: .normal)
        } else {
            button.setTitle("Play", for: .normal)
            player?.pause()
            button.setImage(UIImage(named: "play"), for: .normal)
        }
        isPlaying = !isPlaying
    }
    
    func enablePlayback() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
}

