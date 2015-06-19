//
//  LoginViewController.swift
//  FinalProject-CodingDojo
//
//  Created by J.V. Estolas on 6/18/15.
//  Copyright (c) 2015 J.V. Estolas. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
//    var userName: String?
    
//    @IBAction func loginButtonPressed(sender: UIButton) {
//        userName = nameTextField.text
//        println(userName!)
        
//    }
    

    
//        let socket = SocketIOClient(socketURL: "192.168.1.62:1232") // JV
    let socket = SocketIOClient(socketURL: "192.168.1.7:1232") // ROD
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var DestViewController: ControllerViewController = segue.destinationViewController as! ControllerViewController

        println("user '\(nameTextField.text)' logged in")
        DestViewController.labelText = nameTextField!.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.connect()
        
        socket.on("error") {data, ack in
            println("Got an error, bro!")
        }
        
        socket.on("connect") { data, ack in
            println("iOS::WE ARE USING SOCKETS!")
//            println(self.socket)
        }
    }

}