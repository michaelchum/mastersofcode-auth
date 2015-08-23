//
//  EventsViewController.swift
//  MCFund
//
//  Created by Clarence Leung on 8/22/15.
//  Copyright (c) 2015 Clarence Leung. All rights reserved.
//

import UIKit
import QuartzCore

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var currentBar: UIView!
    @IBOutlet weak var fullBar: UIView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var eventsTable: UITableView!
    
    let cardCellIdentifier = "EventsCell"
    var performances = [
        [
            "time": "5:00 PM",
            "artist": "Taylor Swift",
            "charity": "Doctors Without Borders",
            "avatar": "https://pbs.twimg.com/profile_images/505200807503867904/osJXmYRl.jpeg"
        ],
        [
            "time": "6:00 PM",
            "artist": "Jess Glyne",
            "charity": "Feeding America",
            "avatar": "https://pbs.twimg.com/profile_images/597737112750919680/65RG3g4K.jpg"
        ],
        [
            "time": "7:00 PM",
            "artist": "Kayne West",
            "charity": "Donda's House",
            "avatar": "https://pbs.twimg.com/profile_images/586295203478122496/RejIf-Vf.jpg"
        ],
        [
            "time": "8:00 PM",
            "artist": "Adam Levine",
            "charity": "Declare Yourself",
            "avatar": "https://pbs.twimg.com/profile_images/2708050576/45637f9375bdf044ba5f66376221fa36.jpeg"
        ],
        [
            "time": "9:00 PM",
            "artist": "Luke Bryan",
            "charity": "Doctors Without Borders",
            "avatar": "https://pbs.twimg.com/profile_images/590246542998540288/36KR0LP4.jpg"
        ],
        [
            "time": "10:00 PM",
            "artist": "Katy Perry",
            "charity": "UNICEF",
            "avatar": "https://pbs.twimg.com/profile_images/609748341119844352/7dUd606e.png"
        ],
        [
            "time": "11:00 PM",
            "artist": "Sahat Yalbakov",
            "charity": "The Sahat Foundation",
            "avatar": "https://pbs.twimg.com/profile_images/584239352080764928/vtyPmtEj.jpg"
        ],
    ]
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://i.imgur.com/7aHIbPK.jpg")
        let image = UIImage(data: NSData(contentsOfURL: url!)!)
        
        heroImage.image = image
        heroImage.contentMode = UIViewContentMode.ScaleAspectFill
        
        currentBar.clipsToBounds = true
        eventsTable.rowHeight = 75.0
        eventsTable.backgroundView = UIView(frame: eventsTable.bounds)
        eventsTable.backgroundView?.backgroundColor = UIColor.darkGrayColor()
        
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.eventsTable.reloadData()
        })
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return performances.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cardCellIdentifier) as! EventsCell
        let performance = performances[indexPath.row]
        let avatarURL = NSURL(string: performance["avatar"]!)
                
        cell.timeLabel.text = performance["time"]
        cell.descriptionLabel.text = performance["artist"]! + " - " + performance["charity"]!
        cell.avatarImage.image = UIImage(data: NSData(contentsOfURL: avatarURL!)!)
        cell.avatarImage.layer.cornerRadius = 30
        cell.avatarImage.layer.masksToBounds = true
        return cell
    }
    
}