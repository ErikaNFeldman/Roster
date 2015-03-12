//
//  PersonCell.swift
//  Roster
//
//  Created by Erika Feldman on 3/11/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    
    @IBOutlet weak var personMenuLabel: UILabel!

    @IBOutlet weak var personMenuImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
