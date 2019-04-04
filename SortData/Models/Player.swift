//
//  Player.swift
//  SortData
//
//  Created by Mac on 4/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

//create a struct to store csv data
extension DateFormatter {
    
    //define date formatter for reading date from csv file
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        //formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateFormat = "MMM dd,yyyy"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

//make struct for mapping from csv to this
struct Player : Decodable  {
    var jerseyNumber: String?
    var fullName: String?
    var position: String?
    var height: String?
    var weight: String?
    var dateOfBirth : Date?
    var country: String?
    var yearsInLeague : String?
    var college : String?
    
    //match the names for Strings with header row of csv file
    enum CodingKeys: String, CodingKey {
        case jerseyNumber = "Jersey_Number", fullName = "Name", position = "Position", height = "Height", weight = "Weight", dateOfBirth = "DOB", country = "Country", yearsInLeague = "Years_in_League", college = "College"    }
}
