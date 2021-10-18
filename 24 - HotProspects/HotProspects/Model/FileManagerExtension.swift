//
//  FileManager Extension.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/18/21.
//

import Foundation


extension FileManager {
	// Find the documents directory
	static func getDocumentsDirectory() -> URL {
		// Find all possible directories
		let paths = self.default.urls(for: .documentDirectory, in: .userDomainMask)
		// Get the first one
		return paths[0]
	}
	
	// Make sure the file doesn't already exist
	static func fileAlreadyExists(_ fileName: String) -> Bool {
	  let url = Self.getDocumentsDirectory()
				 .appendingPathComponent(fileName)
	  return self.default.fileExists(atPath: url.path)
	}
	
	// Write changes to the file
	static func writeTo<T: CustomStringConvertible>(content: T, fileName: String) {
		// Get the url for the directory
		let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
		let contentToWrite = content.description
		  
		do {
			// Write changes
			try contentToWrite.write(to: url, atomically: true, encoding: .utf8)
		} catch {
			fatalError("Failed to write to: \(fileName) \(error.localizedDescription)")
		}
	}
	
	static func writeDataTo(content: Data, fileName: String) {
		  let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
		  do {
				try content.write(to: url)
		  } catch {
				fatalError("Failed to write to: \(fileName) \(error.localizedDescription)")
		  }
		}
		 
	 static func contentsOf(fileName: String) -> String {
		  let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
		  
		  do {
				let contents = try String(contentsOf: url)
				return contents
		  } catch {
				fatalError("Failed to read from: \(fileName) \(error.localizedDescription)")
		  }
	 }
		 
	 static func dataContentsOf(fileName: String) -> Data {
		let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
		
		do {
			 let contents = try Data(contentsOf: url)
			 return contents
		} catch {
			 fatalError("Failed to read from: \(fileName) \(error.localizedDescription)")
		}
	}
	
}
