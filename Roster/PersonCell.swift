//
//  PersonCell.swift
//  Roster
//
//  Created by Erika Feldman on 3/11/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personMenuView :UIImageView!
    
    @IBOutlet weak var personMenuLabel :UILabel!  //the ! unwraps the object with the value so that you don't get the object name with the value inside quotations.
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
