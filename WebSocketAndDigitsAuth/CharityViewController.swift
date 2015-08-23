//
//  CharityViewController.swift
//  WebSocketAndDigitsAuth
//
//  Created by Clarence Leung on 8/23/15.
//  Copyright (c) 2015 michaelchum. All rights reserved.
//

import UIKit
import QuartzCore
import Fabric
import DigitsKit
import Socket_IO_Client_Swift

class CharityViewController: UIViewController, SIMChargeCardViewControllerDelegate {
    let socket = SocketIOClient(socketURL: "localhost:3000")
    
    @IBOutlet weak var donateTen: UIButton!
    @IBOutlet weak var currentBar: UIView!
    @IBOutlet weak var fullBar: UIView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var signInDigitsButton: UIButton!
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://i.imgur.com/rgUt9cW.jpg")
        let image = UIImage(data: NSData(contentsOfURL: url!)!)
        
        heroImage.image = image
        heroImage.contentMode = UIViewContentMode.ScaleAspectFill
        
        currentBar.clipsToBounds = true
        donateTen.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        //self.createDigitsButton()
        
        // let chargeVC = SIMChargeCardViewController(publicKey: "sbpb_ZDUzYTExYmUtZjFhZi00MWM0LTk4OGYtYjUxODU1OGFhYTA0")
        
        // chargeVC.delegate = self
        // chargeVC.amount = NSDecimalNumber(double: 10.00)
        // self.presentViewController(chargeVC, animated: true, completion:nil)
    }
    
    // MARK: SimChargeCardViewControllerDelegate
    func creditCardTokenProcessed(token: SIMCreditCardToken!) {
        NSLog("Token: ", token)
    }
    
    func chargeCardCancelled() {
        NSLog("Cancelled!")
    }
    
    func creditCardTokenFailedWithError(error: NSError!) {
        NSLog("Error: ", error)
    }
    
    func createDigitsButton() {
        // Create and initialize a DGTAppearance object with standard colors:
        let digitsAppearance = DGTAppearance()
        // Change color properties to customize the look:
        digitsAppearance.backgroundColor = UIColor.whiteColor()
        digitsAppearance.accentColor = UIColor.orangeColor()
        // Create button
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
            (session: DGTSession!, error: NSError!) in
            // play with Digits session
        })
        authenticateButton.digitsAppearance = digitsAppearance
        authenticateButton.center = self.view.center
        authenticateButton.removeTarget(nil, action: nil, forControlEvents: UIControlEvents.AllTouchEvents)
        authenticateButton.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        //self.signInDigitsButton = authenticateButton;
    }

    // MARK: Twitter Digits
    
    func didTapButton(sender: AnyObject) {
        // Create and initialize a DGTAppearance object with standard colors:
        let digitsAppearance = DGTAppearance()
        // Change color properties to customize the look:
        digitsAppearance.backgroundColor = UIColor.whiteColor()
        digitsAppearance.accentColor = UIColor.orangeColor()
        
        // Start the authentication flow with the custom appearance. Nil parameters for default values.
        let digits = Digits.sharedInstance()
        digits.authenticateWithDigitsAppearance(digitsAppearance, viewController: self, title: "MCFund") { (session, error) in
            // Inspect session/error objects
            //self.socket.emit("connect", session.userID)
        }
    }
    
}