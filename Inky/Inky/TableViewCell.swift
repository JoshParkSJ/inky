//
//  TableViewCell.swift
//  Inky
//
//  Created by Ronin Cunningham on 2019-11-30.
//  Copyright © 2019 JEAR. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    func setLabel(label: Cell) {
        self.label.text = label.label
    }
 
}
