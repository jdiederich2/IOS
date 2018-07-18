//
//  ViewController.swift
//  NumberGuess
//
//  Created by Jennifer Diederich on 10/30/17.
//  Copyright © 2017 Jennifer Diederich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var guessedNumberLabel: UILabel!
    @IBOutlet weak var lastNumberGuessed: UILabel!
    
    var randNum = 0
    var tries = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
    }
    
/* -------------------------------------------------------------------------- */

    // MARK: Actions
    @IBAction func guessButton(_ sender: UIButton) {

        userGuessTextField.delegate = self
        lastNumberGuessed.text = userGuessTextField.text
        
        let guessedNumber = Int(userGuessTextField.text!)
        
        
        guard guessedNumber != nil, guessedNumber! < 100, guessedNumber! > 0 else {
            userGuessTextField.text = ""
            return guessedNumberLabel.text = "Please enter a number from 1 - 100"
            
        }
        
        if (guessedNumber! < 0 || guessedNumber! > 100) {
            
            guessedNumberLabel.text = "Please enter a number"
        }
        
        
        if (guessedNumber! > randNum) {

                guessedNumberLabel.text = "You are not correct. # of tries: \(tries)\n Your guess was too high. Guess again!"
            
        } else {
            
            if (guessedNumber! < randNum) {
                guessedNumberLabel.text = "You are not correct. # of tries: \(tries)\n Your guess was too low. Guess again!"

            } else {
            
                let alert = UIAlertController(title: "Correct!",
                                  message: "It only took you \(tries) guesses",
                                  preferredStyle: .alert)
                
                let playAgain = UIAlertAction(title: "Play Again", style: .default) {
                    
                    [unowned self] action in
                    
                    self.setupGame()
                }
                
                alert.addAction(playAgain)
                
                present(alert, animated: true)

            }

        }
        
        tries += 1
        userGuessTextField.text = ""
        
    }
    
    @IBAction func setupGame() {
        
        // Focus to userGuess field
        userGuessTextField.becomeFirstResponder()
        guessedNumberLabel.text = ""
        lastNumberGuessed.text = ""
        tries = 1
        
        // Handle the text field's user input through delegate callback
        userGuessTextField.delegate = self
        
        randNum = Int(arc4random_uniform(101))
    }

}

