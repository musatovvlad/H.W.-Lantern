//
//  ViewController.swift
//  H.W. Lantern
//
//  Created by влад on 21.02.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    var lightOnOf = true
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPressed()
    }
    
    @IBAction func buttonPressed() {
        lightOnOf.toggle()
        switch count {
        case 0: view.backgroundColor = .red
        case 1: view.backgroundColor = .yellow
        case 2: view.backgroundColor = .green
        default: break
        }
        count += 1
        if count > 2 {
            count = 0
        }
    }
    // Torch
    @IBAction func torchPressed(_ sender: AnyObject) {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if ((device?.hasTorch) != nil) {
            do{
                try device?.lockForConfiguration()
                device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
                device?.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
}

