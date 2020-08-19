//
//  OpeningViewController.swift
//  AnywhereFitness
//
//  Created by Lambda_School_loaner_226 on 8/19/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit
import AVFoundation

class OpeningViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var trainerButton: UIButton!
    
    //MARK: - Functionality Properties
    var player: AVPlayer?
    var customUI = CustomUI()
    
    //MARK: - Lifecycle Views
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVideoBackground()
        configureButtons()
    }
    
    //MARK: - Helper Methods
    func configureVideoBackground() {
        let path = Bundle.main.path(forResource: "AnywhereFitnessOpeningVideo", ofType: "mp4")
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none;
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerItemDidReachEnd), name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object:player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
    }
    
    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
    }
    
    func configureButtons() {
        customUI.customDullButtonCorners(button: userButton)
        customUI.customDullButtonCorners(button: trainerButton)
    }
}
