//
//  JSONDecoder.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//

import Foundation
import CoreData

/*
   This uses the key created in the CodingUserInfoKey extension to get and set a managed object context,
   so it can be used in the class initializer 
*/

extension JSONDecoder {
	 convenience init(context: NSManagedObjectContext) {
		  self.init()
		  self.userInfo[CodingUserInfoKey.managedObjectContext] = context
	 }
}
