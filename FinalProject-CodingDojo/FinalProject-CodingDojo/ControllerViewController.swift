//
//  ControllerViewController.swift
//  FinalProject-CodingDojo
//
//  Created by J.V. Estolas on 6/18/15.
//  Copyright (c) 2015 J.V. Estolas. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController, UITextFieldDelegate {
    
    let socket = SocketIOClient(socketURL: "192.168.1.62:1232") // JV
//    let socket = SocketIOClient(socketURL: "192.168.1.7:1232") // ROD

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var systemLogLabel: UILabel!
    @IBOutlet weak var chatField: UITextField!
    
    @IBAction func sendButtonPressed(sender: UIButton) {
        println("'\(chatField.text)'")
        self.socket.emit("newChatMessage", ["message":self.chatField.text])
        self.chatField.text = ""
        self.chatField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.socket.emit("newChatMessage", ["message":self.chatField.text])
        self.chatField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
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
        socket.emit("XPressedDown")
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
        chatField.delegate = self
        
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


