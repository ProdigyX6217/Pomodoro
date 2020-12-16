//
//  FirstViewController.swift
//  Pomodoro
//
//  Created by Student Laptop_7/19_1 on 12/16/20.
//


import UIKit

class FirstViewController: UIViewController {

    var completedCycles = 0
    @IBOutlet weak var messageLabel: UILabel!
    
    deinit {
        //ACTION: Remove observers
        print("Removed Observer")
        NotificationCenter.default.removeObserver(self, name: Notification.Name("receivedNotification"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ACTION: Add observers
        print("Added Observer")
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(_:)), name: Notification.Name("receivedNotification"), object: nil)
    }
    
    @objc func receivedNotification(_ notification:Notification) {
        // ACTION: Update value of completed cycles
        completedCycles += 1
        // ACTION: Update message label
        messageLabel.text = "\(completedCycles) pomodoro cycles completed today."
        
    }
}

