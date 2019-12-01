//
//  ViewController.swift
//  Inky
//
//  Created by Ronin Cunningham on 2019-11-30.
//  Copyright © 2019 JEAR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var labels: [Cell] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labels = createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Cell] {
        var tempLabels: [Cell] = []
        
//        ADD MORE LABELS HERE
        let label1 = Cell(label: "Lecture 1: Renewable Energy")
        let label2 = Cell(label: "Lecture 2: Data Structures & Algorithms")
        let label3 = Cell(label: "Lecture 3: Nuclea Fusion")
        
        tempLabels.append(label1)
        tempLabels.append(label2)
        tempLabels.append(label3)
        
        
        return tempLabels
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let label = labels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as! TableViewCell
        
        cell.setLabel(label: label)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        SEGUE TO SUMMARY SCREEN
        performSegue(withIdentifier: "summarySegue", sender: self)
    }
}
