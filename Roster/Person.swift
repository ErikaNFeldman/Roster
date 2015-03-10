//
//  Person.swift
//  Roster
//
//  Created by Erika Feldman on 3/5/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

import UIKit

class Person {
    var firstName: String
    var lastName = "Doe"
    var image: UIImage?
    
    init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
    }
}
