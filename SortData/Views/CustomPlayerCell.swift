//
//  CustomPlayerCell.swift
//  SortData
//
//  Created by Mac on 4/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CustomPlayerCell: UITableViewCell {
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var yearsInLeague: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var college: UILabel!
    @IBOutlet weak var jerseyNumber: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var country: UILabel!
    
    
    var player : Player? {
        didSet {
            reloadData()
        }
        
    }
    func reloadData() {
        guard let player = self.player else { return}
        self.fullName.text = player.fullName
        self.college.text = player.college
        self.country.text = player.country
        self.height.text = player.height
        self.weight.text = player.weight
        self.position.text = player.position
        self.jerseyNumber.text = player.jerseyNumber
        self.yearsInLeague.text = player.yearsInLeague
        self.DOB.text = DateToString(date: player.dateOfBirth!)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //clean up cellforresuse .... cell.country.text = ""
        self.fullName.text = ""
        self.college.text = ""
        self.height.text = ""
        self.weight.text = ""
        self.country.text = ""
        self.position.text = ""
        self.jerseyNumber.text = ""
        self.yearsInLeague.text = ""
        self.DOB.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    //convert date to string
    func DateToString(date: Date) -> String {
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
        
        return myStringafd
    }
    
}
