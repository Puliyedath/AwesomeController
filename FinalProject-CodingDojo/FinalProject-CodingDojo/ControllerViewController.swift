//
//  ControllerViewController.swift
//  FinalProject-CodingDojo
//
//  Created by J.V. Estolas on 6/18/15.
//  Copyright (c) 2015 J.V. Estolas. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController {
    
    let socket = SocketIOClient(socketURL: "192.168.1.62:1232")
    
    @IBAction func actionButtonPressed(sender: UIButton) {
        socket.emit("action")
    }
    
    @IBAction func leftButtonPressed(sender: UIButton) {
        socket.emit("left")
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        socket.emit("right")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.connect()
        
        socket.on("error") {data, ack in
            println("Got an error, bro!")
        }
        
        socket.on("connect") { data, ack in
            println("iOS::WE ARE USING SOCKETS!")
            println(self.socket)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


