//
//  ViewController.swift
//  UIUsingCode
//
//  Created by Jennifer Diederich on 11/6/17.
//  Copyright © 2017 Jennifer Diederich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        // NOTE: this app will look ok in portrate, but not so much in landscape
        let container = UIView(frame: CGRect(x: 20, y: 20, width: view.frame.width - 40, height: view.frame.height - 40))
        
        // Need to add to DOM or heirarchy for it to show
        container.backgroundColor = UIColor.darkGray
        
        // THis places the header starting in the top left corner, spanning the width of the container, and 1/4 of the height.
        let header = UIView(frame: CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height * 1/4))
        header.backgroundColor = UIColor.yellow
        

        let body = UIView(frame: CGRect(x: 0, y: container.frame.height / 4, width: container.frame.width, height: container.frame.height * 1/2))
        body.backgroundColor = UIColor.green
        
        
        let footer = UIView(frame: CGRect(x: 0, y: container.frame.height * 0.75, width: container.frame.width, height: container.frame.height * 1/4))
        footer.backgroundColor = UIColor.blue
        
        let firstNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: header.frame.width * 1/3, height: 40))
        firstNameLabel.text = "First Name"
        firstNameLabel.textAlignment = .center
        firstNameLabel.font = UIFont(name: "Arial", size: 18)
        firstNameLabel.backgroundColor = UIColor.lightGray
        
        let firstNameTextField = UITextField(frame: CGRect(x: header.frame.width * 1/3, y: 0, width: header.frame.width * 2/3, height: 40))
        firstNameTextField.placeholder = "Enter your first name"
        firstNameTextField.textAlignment = .center
        firstNameTextField.font = UIFont(name: "Arial", size: 18)
        firstNameTextField.backgroundColor = UIColor.white
        
        
        header.addSubview(firstNameLabel)
        header.addSubview(firstNameTextField)
        
        container.addSubview(header)
        container.addSubview(body)
        container.addSubview(footer)
        
        view.addSubview(container)
        
    }

}

