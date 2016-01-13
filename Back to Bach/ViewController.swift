//
//  ViewController.swift
//  Back to Bach
//
//  Created by Aditya Vikram Godawat on 13/01/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    

    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var scrubSlider: UISlider!
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
    
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("K 545", ofType: "mp3")!))
            
        }catch {
            print("Error!")
        }
        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = Double(scrubSlider.value)
        
    }
    
    func updateScrubSlider(){
        
        scrubSlider.value = Float(player.currentTime)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("K 545", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
        
        }catch {
            print("Error!")
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

