//
//  ShakeEnvironmentController.swift
//  Multi Environment
//
//  Created by Agus Cahyono on 4/10/17.
//  Copyright © 2017 balitax. All rights reserved.
//


import UIKit

class ShakeEnvironmentController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			Config.sharedInstance.handleShake(self)
		}
	}
	
}
