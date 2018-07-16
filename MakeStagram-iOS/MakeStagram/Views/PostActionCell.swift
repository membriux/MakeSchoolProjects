//
//  PostActionCell.swift
//  MakeStagram
//
//  Created by Memo on 7/15/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("Like button tapped")
    }
    
    
}


