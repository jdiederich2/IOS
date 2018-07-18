//
//  AuthorsViewController.swift
//  BookAuthors
//
//  Created by Jennifer Diederich on 11/15/17.
//  Copyright © 2017 assignment3 Jennifer Diederich. All rights reserved.
//

import UIKit

class AuthorsViewController: UITableViewController {
    
    var authors = [AnyObject]()  // Creating a array of any data type objects.  Generic array creation. empty () call array constructor to create empty array object.
    
    // Declare a constant for the cell reuse identifier we will be using...
    let CellIdentifier = "Cell Identifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let filePath = Bundle.main.path(forResource: "Books", ofType: "plist")
        
        if let path = filePath {   // Only way to get inside is if path is not nill first line is the condition
            // If in here, you know you have something.
            
            // initialize our Authors array with the contents of the file provided
            // at our path books.plist
            authors = NSArray(contentsOfFile: path)! as [AnyObject]  // NSArray initializer passing in file path.
                                                                     // Reads the file and puts contents of file and builds it into an array.
        
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #return the number of rows
        return authors.count  // Info from plist
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
