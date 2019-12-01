//
//  SummaryViewController.swift
//  Inky
//
//  Created by Ronin Cunningham on 2019-11-30.
//  Copyright © 2019 JEAR. All rights reserved.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var summarizedText: UITextView!
    override func viewDidLoad() {
        summarizedText.isUserInteractionEnabled = false
    }
}
