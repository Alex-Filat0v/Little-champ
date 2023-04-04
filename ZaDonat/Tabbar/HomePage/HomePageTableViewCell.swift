//
//  HomePageTableViewCell.swift
//  ZaDonat
//
//  Created by MacUniverse on 27.03.2023.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var acceptTaskButtonView: UIButton!
    
    @IBOutlet weak var rejectTaskButtonView: UIButton!
    
    @IBAction func acceptTaskButtonAction(_ sender: UIButton) {
    }

    @IBAction func rejectTaskButtonAction(_ sender: UIButton) {
    }

}
