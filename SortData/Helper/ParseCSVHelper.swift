//
//  ParseCSVHelper.swift
//  SortData
//
//  Created by Mac on 4/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import CSV


class ParseCSVHelper {
    static var headerRow = [String]()
    //read file path
    static func readFilePath() -> String? {
        
        // get the file path from bundle resources
        guard let filePath = Bundle.main.path(forResource: "players", ofType: "csv")
            else {
                return nil //if file not found
        }
        // return filepath if exist
        return filePath
    }
    
    //populate data from csv to player object
    static func populatePlayerData(filePath: String) -> [Player]{
        
        //create stream for file
        let stream = InputStream(fileAtPath: filePath)!
        
        // use CSV.swift reader
        let csv = try! CSVReader(stream: stream, hasHeaderRow: true)
        
        //initialize players struct to populate data into
        var records = [Player]()
        
        //do catch block for try statement of decoder
        do {
            while let row = csv.next() {
                //We define a generic system that takes a row header and creates a key for a player by that value.
                print("\(row)")
                
                //decode csv row
                let decoder = CSVRowDecoder()
                
                //format the date before copying data
                decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                
                //decode the data by row
                let dataRow = try decoder.decode(Player.self, from: csv)
                
                records.append(dataRow) // append decoded row to players object array
                
            }
        } catch {
            print("decoder is through error")
            
        }
        
        print(records)
        
        //close the stream after done reading
        stream.close()
        
        return records
    }
    
    
}
