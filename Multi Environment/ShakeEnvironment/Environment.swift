//
//  Environment.swift
//  Multi Environment
//
//  Created by Agus Cahyono on 4/13/17.
//  Copyright © 2017 balitax. All rights reserved.
//

import Foundation


struct Environment {
	
	static func development() -> NSDictionary {
		
		return [
			"urlEndpoint": "http://google.com/development",
			"urlSocket": "http://google.com/development"
		]
		
	}
	
	static func staging() -> NSDictionary {
		
		return [
			"urlEndpoint": "http://google.com/staging",
			"urlSocket": "http://google.com/staging"
		]
		
	}
	
	static func production() -> NSDictionary {
		
		return [
			"urlEndpoint": "http://google.com/production",
			"urlSocket": "http://google.com/production"
		]
		
	}
	
	
}
