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
        println("TEst top")
        self.title = "List"
        self.tableView.backgroundColor = UIColor.purpleColor()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        var cara = Person(firstName: "Cara", lastName: "D")
        var erika = Person(firstName: "Erika", lastName: "Feldman")
        var rene = Person(firstName: "Rene", lastName: "G")
        var sarah = Person(firstName: "Sarah", lastName: "Hermanns")
        var brad = Person(firstName: "Brad", lastName: "Johnson")
        var jung = Person(firstName: "Jung", lastName: "Kim")
        var robert = Person(firstName: "Robert", lastName: "Klein")
        var kevin = Person(firstName: "Kevin", lastName: "Lam")
        var hsia = Person(firstName: "Hsia-Chou", lastName: "Lin")
        var randy = Person(firstName: "Randy", lastName: "McLain")
        var jayden = Person(firstName: "Jayden", lastName: "Tan")
        var reeve = Person(firstName: "Reeve", lastName: "Vogel")
        var jacquin = Person(firstName: "Jacquin", lastName: "Wynn")
        
        self.people.append(cara)
        self.people.append(erika)
        self.people.append(rene)
        self.people.append(sarah)
        self.people.append(brad)
        self.people.append(jung)
        self.people.append(robert)
        self.people.append(kevin)
        self.people.append(hsia)
        self.people.append(randy)
        self.people.append(jayden)
        self.people.append(reeve)
        self.people.append(jacquin)
        
        self.view.backgroundColor = UIColor.purpleColor()
        println("Test")
    }
    
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPerson" {
            println("showing person")
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let person = self.people[indexPath!.row]
            destinationVC.selectedPerson = person
            destinationVC.title = "Person"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let person = self.people[indexPath.row]
        cell.textLabel?.text = person.firstName + " " + person.lastName
        return cell
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        self.tableView.reloadData()
        
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
