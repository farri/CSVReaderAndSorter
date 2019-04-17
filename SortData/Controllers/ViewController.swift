//
//  ViewController.swift
//  SortData
//
//  Created by Mac on 4/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DateSortSegment: UISegmentedControl!
    
    var playersArray : [Player]?
    let sortOptions = [
        ["Name ASC": "NameA"], ["Name DES": "NameD"], ["Country ASC": "CountryA"], ["Country DES": "CountryD"], ["Date ASC": "DateA"], ["Date DES": "DateD"], ["Weight ASC": "WeightA"],["Weight DES": "WeightD"]]
    
    //show alertview on sorting option button
    @IBAction func SortBtnClicked(_ sender: Any) {
        self.showActionSheetToSelectSortOption()
    }
    
    //create segment action for data sorting on date of birth of Players
    @IBAction func SegmentValueChanged(_ sender: Any) {
        
        switch DateSortSegment.selectedSegmentIndex
        {
        case 0:
            print("First Segment Selected")
            self.playersArray = self.playersArray?.sort(sortOn: "DateA")
            self.tableView.reloadData()
            
        case 1:
            print("Second Segment Selected")
            self.playersArray = self.playersArray?.sort(sortOn: "DateD")
            self.tableView.reloadData()
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Assign delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        //register cell
        tableView.register(UINib(nibName: "CustomPlayerCell", bundle: nil), forCellReuseIdentifier: "CustomPlayerCell")
        
        //read csv file
        if let filePathString = ParseCSVHelper.readFilePath() {
            
            //populate data from csv to Player struct Array
            let playersData = ParseCSVHelper.populatePlayerData(filePath: filePathString)
            playersArray = playersData
            
            //reload table after data population
            tableView.reloadData()
        }
        
    }
    
    //sorting option alertview implementation
    func showActionSheetToSelectSortOption() {
        
        
        //create alert buttons for sorting options
        let alert = UIAlertController(title: "Sorting", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        for option in sortOptions {
            
            guard let key = option.keys.first, let value = option.values.first else {
                return
            }
            
            alert.addAction(UIAlertAction(title: key, style: .default, handler: { (_) in
                print("User click name ASCEN")
                self.playersArray = self.playersArray?.sort(sortOn: value)
                self.tableView.reloadData()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (_) in
            print("User click cancel")
        }))
        
        //for ipad use popover
        if let popoverPresentationController = alert.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
        
    }
}

//create extension for tableview delegates
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    ///////////////////////////////////////////
    
    //MARK: - TableView Delegate Methods
    
    //change bg color of rows
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0){
            cell.contentView.backgroundColor = UIColor(hue: 0.5111, saturation: 0.29, brightness: 0.88, alpha: 1.0)
        } else {
            cell.contentView.backgroundColor = UIColor(hue: 0.6194, saturation: 0.29, brightness: 0.95, alpha: 1.0)
        }
    }
    
    //total numbers of rows in cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersArray!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: - TableView Datasource Methods
    
    //tableview delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  let cell : CustomPlayerCell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for : indexPath) as! CustomPlayerCell
        // let cellIdentifier = "PlayerCell"
        let cellIdentifier = "CustomPlayerCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomPlayerCell  else {
            fatalError("The dequeued cell is not an instance of CustomPlayerCell.")
        }
        
        //fetch player at indexpath.row
        let player = playersArray![indexPath.row]
        
        //assign player object data to player object inside custom cell implementation
        cell.player = player
        return cell
    }
}


