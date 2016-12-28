//
//	Creator.swift
//
//	Create by taonei on 28/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Creator{

	var gender : Int!
	var id : Int!
	var level : Int!
	var nick : String!
	var portrait : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		gender = dictionary["gender"] as? Int
		id = dictionary["id"] as? Int
		level = dictionary["level"] as? Int
		nick = dictionary["nick"] as? String
		portrait = dictionary["portrait"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if gender != nil{
			dictionary["gender"] = gender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if level != nil{
			dictionary["level"] = level
		}
		if nick != nil{
			dictionary["nick"] = nick
		}
		if portrait != nil{
			dictionary["portrait"] = portrait
		}
		return dictionary
	}

}
