//
//  CodingUserInfoKey.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//

import Foundation

/*
 This is used to decode JSON into Core Data Objects.
 It creates a key to a managed object context, which can be used to get and set a managed object context.
 This is necessary because ...
  A) All managed objects must have a managed object context
  B) You cannot pass a managed object context directly to the class initializer.
*/

extension CodingUserInfoKey {
	static let managedObjectContext = CodingUserInfoKey(rawValue: "context")!
}
