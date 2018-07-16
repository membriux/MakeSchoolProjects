//
//  PostHeaderCell.swift
//  MakeStagram
//
//  Created by Memo on 7/15/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("options button tapped")
    }
    
    
    
}




