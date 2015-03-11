//
//  ViewController.swift
//  Roster
//
//  Created by Erika Feldman on 3/5/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!

    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        println("Test top")
        self.title = "List"
        self.tableView.backgroundColor = UIColor.purpleColor()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        if let filePath = NSBundle.mainBundle().pathForResource("People",ofType: "plist"){
            println(filePath)
            if let plistArray = NSArray(contentsOfFile: filePath) {
                print(plistArray.count)
            }
        }
        
        self.view.backgroundColor = UIColor.purpleColor()
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        self.tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        let personToDisplay = self.people[indexPath.row]
        cell.personMenuLabel.text = personToDisplay.firstName
        if personToDisplay.image != nil {
            cell.personMenuView.image = personToDisplay.image
        } else {
            cell.personMenuView.image = UIImage(named: "playIAm.jpg")
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPersonDetail" {
            println("showing person")
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let person = self.people[indexPath!.row]
            destinationVC.title = "Person"
            destinationVC.selectedPerson = person
        }
    }
    
  
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
}
