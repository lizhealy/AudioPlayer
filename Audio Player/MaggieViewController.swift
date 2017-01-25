//
//  MaggieViewController.swift
//  Audio Player
//
//  Created by Liz Healy on 1/25/17.
//  Copyright © 2017 netGalaxy Studios. All rights reserved.
//

import UIKit
import AVFoundation

class MaggieViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var songTime = Timer()
    let audioPath = Bundle.main.path(forResource: "alaska", ofType: "mp3")
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
        
        songTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MaggieViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        durationSlider.value = Float(player.currentTime)
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
        songTime.invalidate()
    }
    
    @IBAction func volumeSliderMoved(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func durationSliderMoved(_ sender: Any) {
        player.currentTime = TimeInterval(durationSlider.value)
    }
    
    @IBAction func back(_ sender: Any) {
        player.stop()
        songTime.invalidate()
        durationSlider.value = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            durationSlider.maximumValue = Float(player.duration)
            
            
        }
        catch {
            //process errors
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
