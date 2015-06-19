//
//  ControllerViewController.swift
//  FinalProject-CodingDojo
//
//  Created by J.V. Estolas on 6/18/15.
//  Copyright (c) 2015 J.V. Estolas. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController {
    
    let socket = SocketIOClient(socketURL: "192.168.1.62:1232") // JV
//    let socket = SocketIOClient(socketURL: "192.168.1.7:1232") // ROD

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var systemLogLabel: UILabel!
    

    
    @IBAction func XButtonTouchUpOutside(sender: UIButton) {
        println("X released up outside of button")
        socket.emit("XPressedUp")
    }
    @IBAction func XButtonUp(sender: UIButton) {
        println("X: up released inside of button")
        socket.emit("XPressedUp")
    }
    @IBAction func XButtonDown(sender: UIButton) {
        println("X: down pressed")
    }
    
    @IBAction func UpButtonRepeat(sender: UIButton) {
        println("UP: touch down repeat event!!!")
    }
    
    
    @IBAction func OButtonPressed(sender: UIButton) {
        println("O pressed")
        socket.emit("OPressed")
    }
    
    @IBAction func YButtonPressed(sender: UIButton) {
        println("Y pressed")
        socket.emit("YPressed")
    }
    
    @IBAction func leftButtonPressed(sender: UIButton) {
        println("left pressed")
        socket.emit("left")
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        println("right pressed")
        socket.emit("right")
    }
    
    @IBAction func upButtonPressed(sender: UIButton) {
        println("up pressed")
        socket.emit("up")
    }
    
    @IBAction func downButtonPressed(sender: UIButton) {
        println("down pressed")
        socket.emit("down")
    }
    
    var labelText = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = labelText
        
        socket.connect()
        
        socket.on("error") {data, ack in
            println("Got an error, bro!")
        }
        
        socket.on("connect") { data, ack in
            self.socket.emit("userName", ["userName": self.labelText])
//            println("iOS::WE ARE USING SOCKETS!")
//            println(self.socket)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


