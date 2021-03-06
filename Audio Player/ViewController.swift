//
//  ViewController.swift
//  Audio Player
//
//  Created by Liz Healy on 1/25/17.
//  Copyright © 2017 netGalaxy Studios. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    
    var player = AVAudioPlayer()
    var songTime = Timer()
    let audioPath = Bundle.main.path(forResource: "rehab", ofType: "mp3")
    

    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        songTime.invalidate()
    }
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        
        songTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)

    
    }
    
    @IBAction func back(_ sender: Any) {
        songTime.invalidate()
        player.stop()
        durationSlider.value = 0
    }
    @IBAction func sliderMoved(_ sender: Any) {
        
        player.volume = slider.value
    }
    
    @IBAction func durationSliderMoved(_ sender: Any) {
        player.currentTime = TimeInterval(durationSlider.value)
    }
    
    
    @IBOutlet weak var pause: UIButton!
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

    
    func updateTime() {
        durationSlider.value = Float(player.currentTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

