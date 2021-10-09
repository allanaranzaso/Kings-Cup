//
//  Data.swift
//  KingsCup
//
//  Created by Allan Aranzaso on 2021-10-08.
//

import Foundation

// Load a static Json file from the project
/**
 Loads a static JSON file from the project. You will want to call the function and assign it to the array you want to load the file into. The Type must conform to Decodable.
 
 fileName: the name of the file without the .json extension. The resource is stored in the project internally.
 
 Returns an array of the objects loaded from the JSON file.
 */
func loadJSON<T: Decodable>(_ fileName: String) -> [T] {
    
    lazy var newArray: [T] = []
    
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
        fatalError("JSON file: \(fileName) could not be loaded. Check the file name.")
    }
    
    let url = URL(fileURLWithPath: path)

    do {
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode([T].self, from: data)
        for item in response {
            newArray.append(item)
        }
    } catch {
        debugPrint(error)
    }
    return newArray
}
