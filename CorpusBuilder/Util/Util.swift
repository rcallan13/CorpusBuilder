//
//  Util.swift
//  pika
//
//  Created by Ron Allan on 2019-03-06.
//  Copyright © 2019 RCAL Software Solutions. All rights reserved.
//

import Cocoa

class Util {
    
    static var fileURL: URL?
    
    /**
     read in the json file
     */
    public static func readJsonFile(_ name: String) -> Response? {
        
        if let filepath = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let data = contents.data(using: .utf8)
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                return response
            } catch {
                // contents could not be loaded
                NSLog("Error: \(error)")
            }
        }
        return nil
    }
    
    public static func writeDataToFile(_ dataStr: String?, file: String) -> Bool {
       
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        for p in paths {
            NSLog(p.absoluteString)
        }
        //[0]    URL    "file:///Users/ronallan/Library/Containers/com.rcal.CorpusBuilder/Data/Documents/"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            fileURL = dir.appendingPathComponent(file)
            
            //writingc
            do {
                try dataStr?.write(to: fileURL!, atomically: false, encoding: .utf8)
                return true
            }
            catch {/* error handling here */}
        }
        return false
    }
    
}
