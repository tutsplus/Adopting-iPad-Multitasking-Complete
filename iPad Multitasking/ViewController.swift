//
//  ViewController.swift
//  iPad Multitasking
//
//  Created by Davis Allie on 1/11/2015.
//  Copyright © 2015 tutsplus. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, AVPlayerViewControllerDelegate {

    @IBOutlet weak var viewWidth: UILabel!
    @IBOutlet weak var sizeClass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as!
        AVPlayerViewController
        destination.delegate = self
        let url = NSBundle.mainBundle().URLForResource("Video", withExtension: "mp4")!
        destination.player = AVPlayer(URL: url)
        destination.player?.play()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        self.viewWidth.text = "\(size.width)pts wide"
    }

    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
        
        switch newCollection.horizontalSizeClass {
        case .Compact:
            self.sizeClass.text = "Compact Horizontal Size Class"
        case .Regular:
            self.sizeClass.text = "Regular Horizontal Size Class"
        case .Unspecified:
            self.sizeClass.text = "Unspecified Horizontal Size Class"
        }
    }
    
    func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(playerViewController: AVPlayerViewController) -> Bool {
        return false
    }
    
    // MARK: AVPictureInPictureController Example
    /*self.pictureinPictureController = AVPictureInPictureController(playerLayer: layer)
    self.pictureinPictureController.delegate = // Any object conforming to the AVPictureInPictureViewControllerDelegate protocol
    if AVPictureInPictureController.isPictureInPictureSupported() {
    // Display button to enter Picture in Picture
    }
    
    ...
    
    
    func pictureinPictureButtonPressed() {
        self.pictureInPictureController.startPictureInPicture()
    }*/
}

