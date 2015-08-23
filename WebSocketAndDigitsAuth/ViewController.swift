//
//  ViewController.swift
//  WebSocketAndDigitsAuth
//
//  Created by Michael Ho on 2015-08-22.
//  Copyright (c) 2015 michaelchum. All rights reserved.
//

import UIKit
import DigitsKit
import Socket_IO_Client_Swift


class ViewController: UIViewController {
    let socket = SocketIOClient(socketURL: "localhost:3000")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.view.addSubview(authenticateButton)
        
        // Connect websocket
        self.websocketHandlers()
        self.socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        digits.authenticateWithDigitsAppearance(digitsAppearance, viewController: nil, title: "MCFund") { (session, error) in
            // Inspect session/error objects
            self.socket.emit("connect", session.userID)
        }
    }
    
    // MARK: Websocket
    
    func websocketHandlers() {
        self.socket.on("registered") {[weak self] data, ack in

        }
        self.socket.on("connect") {[weak self] data, ack in
            
        }
    }

}

