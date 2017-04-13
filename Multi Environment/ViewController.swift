//
//  ViewController.swift
//  Multi Environment
//
//  Created by Agus Cahyono on 4/10/17.
//  Copyright © 2017 balitax. All rights reserved.
//

import UIKit

class ViewController: ShakeEnvironmentController, ConfigDelegate {
	
	@IBOutlet weak var envPosition: UILabel!
	
	let configs = Config.sharedInstance

	override func viewDidLoad() {
		super.viewDidLoad()
		
		configs.delegate = self
		
		let envStatus 		= Config.sharedInstance.currentConfiguration as? String
		envPosition.text 	= envStatus?.uppercased()
		
	}
	
	func envShanged(_ env: String) {
		self.envPosition.text = env.uppercased()
		print("ENV \(env)")
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
	}

	@IBAction func printAPIEndpoint(_ sender: UIButton) {
		print("URL API ENDPOINT : \(Config.sharedInstance.apiEndpoint()), SOCKET : \(Config.sharedInstance.socketEndpoint())")
		let endPoint = Environment.production().allKeys
		print("URL SWIFT : \(endPoint)")
	}
	


}

