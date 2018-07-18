//
//  ViewController.swift
//  GroupSorter
//
//  Created by Jennifer Diederich on 10/25/17.
//  Copyright © 2017 Jennifer Diederich. All rights reserved.
//

import UIKit

// : states that our class is a sub class of parent class (blue color)
class ViewController: UIViewController {
    
    
    @IBOutlet weak var rosterLabel: UILabel!
    var numGroups = 1
    
		// Override overrides the parent class viewDidLoad() method
		// viewDidLoad() is automatically called always... never need to call
    override func viewDidLoad() {
			
				// Still want function from parent, override allows us to add more function to supers function
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
	
	//
	// Set number of groups is aclled when user taps Set Number of Groups button
    @IBAction func setNumberOfGroups(_ sender: UIButton) {
			
			// Create an alert popup to ask how many groups user wants
			// roster sorted into
			//
			// Alerts require 4-steps:
			//
			// Step 1: Create an instance of UIAlertController class
			let alert = UIAlertController(title: "Number of Groups",
			                              message: "How many groups would you like?",
			                              preferredStyle: .alert)
			
			
			// Step 2: Create action(s) related to buttons on alert
			let saveAction = UIAlertAction(title: "Save", style: .default) {
				
				[unowned self] action in
				
				// if first condition true, will move to the next statement before the else... nested if
				// textField is an object... .text is its content
				guard let textField = alert.textFields?.first, let numGroupsToSave = textField.text else {
					return
				}
				
				/* if let textField = alert.textFields?.first {
						 do something
						} else {
						return
						}
				*/
				
				// Check if the number we got from the alerts textField is a valid integer
				// If it is not set the numGroups property back to 1.
				if let groupQuantity = Int(numGroupsToSave) {
					self.numGroups = groupQuantity
					
				} else {
					self.numGroups = 1
				}
				
				print("Number of groups = \(self.numGroups)")
				
			}
			
			// Set up a cancel action for our alert
			let cancelAction = UIAlertAction(title: "Cancel", style: .default)
			
			// Add a text field to our alert popup - removed wanted parameters
			alert.addTextField()
			
			
			// Step 3: Add actions to the alert object cretaed in step 1
			alert.addAction(saveAction)
			alert.addAction(cancelAction)
			
			
			// Step 4: Present the alert to the user (Make it visible to them)
			present(alert, animated: true)
			
    }
	
	//
	// groupSort is called when the Sort button is tapped
	//
    @IBAction func groupSort(_ sender: UIButton) {
			
			// Get location to file we wish to open
			let fileName = Bundle.main.url(forResource: "roster", withExtension: "txt")!
			
			// Open and retrieve contents of roster.txt
			//
			// Use a do-catch block which is similar to try-catch blocks in other languages.
			//
			// The do block runs code (and can include try statements) and the catch block
			// is used to do any error processing if the do code fails.
			//
			// Note that multiple catch blocks can be present with patterns for
			// specific error conditions.  If a catch block has no pattern (or _),
			// it will handle any error that occurs (generic catch-all).
			//
			do {
				
				// 1. Read contents of file roster.txt into a string
				//
				// The String class's init(contentsOf: encoding:) init method
				// produces a string created by reading data from a given url, which in our case
				// is fileName, interpreted using a given encoding. In this case, we are getting
				// the contents of roster.txt in one string.
				let fileContent = try String(contentsOf: fileName, encoding: String.Encoding.utf8)
				
				// 2. Retrieve array of students from file string
				//
				// The components(separatedBY:) method returns an array of
				// substrings from the given string (fileContent) that have
				// been devided based on the "\n" character.
				let students = fileContent.components(separatedBy: "\n")
				
				
				// 3. Randomize the array of students
				let randomizedStudents = randomize(students)
				
				
				// 4. Divide randomized students into groups
				let groups = divideIntoGroups(randomizedStudents, numGroups)
				
				
				// 5. Create text for roster label for our groups
				var groupNumber = 1
				var output = ""
				
				for group in groups {
					
					// concatentate new output onto our output string
					output += createOutputForGroups(group, withGroupNumber: groupNumber)
					
					groupNumber += 1
					
				}
				
				rosterLabel.text = output
				
			} catch _ {  // Underscore means catch any error
				// MARK: - do something here for errors in the future...
			}
			
    }
	
	
	// fileprivate means that this function is private to code in this file.
	//
	// private keyword means that the item would only ba available to code within its
	// lexical scope meaning code within the curly braces the item is declared in.
	//
	// Note the use of the underscore in the parameter list which means that when this method is
	// called, the first parameter will not require the label (arrayOfStrings: in this case)
	// to be specified in the call.
	fileprivate func randomize(_ arrayOfStrings: [String]) -> [String] {  // Underscore means you do not
		// need to pass a label of the first argument
		
		// if the array only has one (or no) element(s), then don't bother
		// doing any randomizing...
		if arrayOfStrings.count < 2 {
			return arrayOfStrings
		}
		
		var list = arrayOfStrings  // Make a copy to use that can be altered (mutable)
		
		// Step through the array one element at a time.
		for index in 0..<(list.count - 1) {
			
			// Get a random index number from within the array
			let randomIndex = Int(arc4random_uniform(UInt32(list.count - index))) + index
			
			// If our current element's index is not the same as the
			// randomly genereated elements index, then swap the elements
			// at those indexes
			if  index != randomIndex {
				
				list.swapAt(index, randomIndex)
			}
		}
		
		return list
		
	}
	
	fileprivate func divideIntoGroups(_ studentNames: [String], _ numberOfGroups: Int) -> [[String]] {
		
		// [[]] array of arrays - multidimentional array
		// Step 1. Create empty groups up to numberOfGroups
		var groups = [[String]]()
		var i = 0
		
		while i < numberOfGroups {
			
			// add a new (empty) element to groups array which is itself an array
			// of strings
			groups.append([String]())
			i += 1
			
		}
		
		// Step 2. Divide our passed-in strings array into groups
		var groupNumber = 0
		
		// Step through the passed-in strings array grabbing the value
		// of each element automatically one at a time(like a foreach loop in other languages)
		for studentName in studentNames {
			
			// Add the current student name to an eoement of groups based on groupNumber
			groups[groupNumber].append(studentName)
			
			// Change the group number for the next student name we get by either adding
			// one if not at group number limit or reset groupNumber to 0
			if groupNumber < (numberOfGroups - 1) {
				groupNumber += 1
			} else {
				groupNumber = 0
			}

		}
		
		return groups
		
	}
	
	fileprivate func createOutputForGroups(_ group: [String], withGroupNumber groupNumber: Int) -> String {
		
		var output = "Group \(groupNumber): \n"
		
		for student in group {
			output += student + "\n"
		}
		
		return output + "\n"
		
	}

}

































