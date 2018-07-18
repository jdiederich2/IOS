//
//  ViewController.swift
//  TapMe
//
//  Created by Jennifer Diederich on 11/8/17.
//  Copyright © 2017 Jennifer Diederich. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
 
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var seconds = 0
    var timer = Timer()  // Instantiates the timer class
    
    // Sound related instance variables declared as optionals just in case
    // the AVAudioPlayer class is not available.
    
    var buttonBeep: AVAudioPlayer?
    var secondBeep: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view.backgroundColor = UIColor.purple
        
        //Creates image as a background pattern
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_tile.png")!)
        
        timerLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!)
        scoreLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!)
        
        // Create each of our audio players. If the players can be carete, the objects
        // will be assigned to instance variables. After this the sounds will be ready to play.
        //
        // NOTE: Because the instance variables are optionals?, we need to verify
        //       they are not nil before using them or we will have runtime errors.
        //
        //       We will use if/lets ... (optional binding)
        if let buttonSound = self.setupAudioPlayerWithFIle("ButtonTap", "wav") {
            self.buttonBeep = buttonSound
        }
        
        // Showing that we can use the same name as our variable above because of scope.
        if let secondBeep = self.setupAudioPlayerWithFIle("SecondBeep", "wav") {
            self.secondBeep = secondBeep
        }
        
        if let bgMusic = self.setupAudioPlayerWithFIle("HallOfTheMountainKing", "mp3") {
            self.backgroundMusic = bgMusic
        }
        
        setupGame()
 
    }
    
    func setupGame() {
        
        seconds = 10
        score = 0
        
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \n\(score)"
        
        // Start the timer
        // Below is a class method
        // Schedule timer that every second is going to call our subtractTime method
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(ViewController.subtractTime),
                                     userInfo: nil,
                                     repeats: true)
        
        // Play background music
        backgroundMusic?.volume = 0.3
        backgroundMusic?.play()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // print("button pressed")
        // scoreLabel.text = "button pressed"
        score += 1
        
        scoreLabel.text = "Score: \n\(score)"
        
        buttonBeep?.play()
    }
    
    
    // Called every second from our timer.  Should decrement seconds,
    // update the timer label and cause the alert to popup
    // when seconds reaches zero - end game scenario
    @objc func subtractTime() {
        
        seconds -= 1
        
        timerLabel.text = "Time: \(seconds)"
        
        secondBeep?.play()
        
        if seconds == 0 {
            
            // Stop timer
            timer.invalidate()
            
            // Create and alert that takes control temporarily away
            // from the user
            
            // Step 1: Create UIAlertController object
            let alert = UIAlertController(title: "Time is up!",
                                          message: "You scored \(score) points",
                                          preferredStyle: .alert)
            
            // Step 2: Adjust what the button says and does with UIAlertAction
            let playAgainAction = UIAlertAction(title: "Play Again?",
                                                style: .default,
                                                handler: {action in self.setupGame()})
            
            // Step 3: Add the action(s) to the alert
            alert.addAction(playAgainAction)
            
            // Step 4: Tell app to present(show) the alert
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    // Helper method to properly find and load audo files connecting the audio file in our
    // project to an AVAudioPlayer object
    //
    func setupAudioPlayerWithFIle(_ file: String, _ type: String) -> AVAudioPlayer? {
        
        // Use bundle to tell XCode where in the project ot look for the
        // passed-in file. It will give us the full (absolute) path to the file
        // in return. In this case the root directory is our project directory.
        let path = Bundle.main.path(forResource: file, ofType: type)
        
        // AVAudioPlayer needs the path in the form of a url so
        // we need to convert the full path we just got to url format
        let url = URL(fileURLWithPath: path!)
        
        // Declare an AVAudioPlayer variable as an optional in case there is a condition when
        // an avaudioPlayer object cannot be created which could be dependant on the deivce
        // that is trying to instantiate it.
        var audioPlayer: AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
        
    }
    
    

}
















