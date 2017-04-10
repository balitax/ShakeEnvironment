//
//  Config.swift
//  Multi Environment
//
//  Created by Agus Cahyono on 4/10/17.
//  Copyright © 2017 balitax. All rights reserved.
//

import UIKit

enum ShakeEnv {
	case Production
	case Development
	case Staging
	case Other
}

protocol ConfigDelegate {
	func envShanged(_ env: String)
}

class Config: NSObject {
	
	static let sharedInstance = Config()
	
	var configs:  NSDictionary!
	var envPosition = ShakeEnv.Production
	var delegate: ConfigDelegate?
	
	// take current configuration from the 'Info.plist'
	var currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Config")!
	
	override init() {
		
		super.init()
		
		let initConfiguration = currentConfiguration as! String
		
		if initConfiguration == "Development" {
			self.envPosition = .Development
		} else if initConfiguration == "Production" {
			self.envPosition = .Production
		} else {
			self.envPosition = .Staging
		}
		
		self.initiateEnvironment()
		
	}
	
	func initiateEnvironment() {
		
		if envPosition == .Development {
			currentConfiguration = "Development"
		} else if envPosition == .Production {
			currentConfiguration = "Production"
		} else {
			currentConfiguration = "Staging"
		}
		
		self.delegate?.envShanged(currentConfiguration as! String)
		
		print("CURRENT \(currentConfiguration)")
		
		// loads 'Config.plist' and store it to dictionary.
		let path = Bundle.main.path(forResource: "Config", ofType: "plist")
		configs = NSDictionary(contentsOfFile: path!)!.object(forKey: currentConfiguration) as! NSDictionary
		
	}
	
	func handleShake(_ currentViewController: UIViewController) {
		// disable shake on production
//		if self.envPosition != .Production {
//			print("Disable shake on production")
			Config.sharedInstance.showEnvironmentSheet(currentViewController)
//		}
	}
	
	func showEnvironmentSheet(_ currentViewController: UIViewController) {
		
		// Initialize alert
		let alertTitle: String = "CURRENT ENV: \(Config.sharedInstance.currentConfiguration)"
		
		let alert = UIAlertController(title: alertTitle,
		                              message: nil,
		                              preferredStyle: .actionSheet)
		
		let devAction = UIAlertAction(title: "Development",
		                              style: .default,
		                              handler: { (action: UIAlertAction) in
										
										self.envPosition = .Development
										self.initiateEnvironment()
										
		})
		let prodAction = UIAlertAction(title: "Production",
		                               style: .default,
		                               handler: { (action: UIAlertAction) in
										
										self.envPosition = .Production
										self.initiateEnvironment()

		})
		
		let stagingAction = UIAlertAction(title: "Staging",
		                               style: .default,
		                               handler: { (action: UIAlertAction) in
										
										self.envPosition = .Staging
										self.initiateEnvironment()
		})
		
		let cancelAction = UIAlertAction(title: "Cancel",
		                                 style: .cancel,
		                                 handler: nil)
		
		// Add button to alert
		alert.addAction(devAction)
		alert.addAction(prodAction)
		alert.addAction(stagingAction)
		alert.addAction(cancelAction)
		
		// Show alert
		currentViewController.present(alert, animated: true, completion: nil)
	}
	
}


extension Config {
	
	func apiEndpoint() -> String {
		return configs.object(forKey: "APIEndpointURL") as! String
	}
	
	func socketEndpoint() -> String {
		return configs.object(forKey: "globalSocketURL") as! String
	}
	
}







































