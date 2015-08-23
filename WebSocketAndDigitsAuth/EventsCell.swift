//
//  EventsCell.swift
//  WebSocketAndDigitsAuth
//
//  Created by Clarence Leung on 8/23/15.
//  Copyright (c) 2015 michaelchum. All rights reserved.
//

import UIKit

class EventsCell : UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}