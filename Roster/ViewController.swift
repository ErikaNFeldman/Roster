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
        
        let filePath = NSBundle.mainBundle().pathForResource("People",ofType: "plist")
            println(filePath)
        let plistArray = NSArray(contentsOfFile: filePath!)
        
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["firstName"] as String
                let lastName = personDictionary["lastName"] as String
                
                var person = Person(firstName: firstName, lastName: lastName)
                self.people.append(person)
            } // if let personDictionary
        } // for object
        
        self.view.backgroundColor = UIColor.purpleColor()
        self.tableView.dataSource = self
    } // viewDidLoad()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        self.tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as PersonCell
        let personToDisplay = self.people[indexPath.row]
        cell.personMenuLabel.text = personToDisplay.firstName
        if personToDisplay.image != nil {
            cell.personMenuImage.image = personToDisplay.image
        } else {
            cell.personMenuImage.image = UIImage(named: "playIAm.jpg")
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
