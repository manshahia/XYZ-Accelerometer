//
//  ViewController.swift
//  XYZ : Accelerometer
//
//  Created by Ravi Inder Manshahia on 13/02/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager : CMMotionManager!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)

    }

    func updateLabels( data : CMAccelerometerData?, error : Error?)
    {
        if let accData = data
        {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 1
            formatter.maximumFractionDigits = 1
            
            let x = formatter.string(for: accData.acceleration.x)!
            let y = formatter.string(for: accData.acceleration.y)!
            let z = formatter.string(for: accData.acceleration.z)!
            
            xLabel.text = "X : \(x)"
            yLabel.text = "Y : \(y)"
            zLabel.text = "Z : \(z)"
        }
        else
        {
            return
        }
    }
}

