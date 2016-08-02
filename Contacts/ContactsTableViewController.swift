//  TESTING TESTING
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Gladys Umali on 7/29/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [Contact] = []    // creating empty contact array

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a few contacts here...
        
        let daniele = Contact(name: "Daniele", firstInitial: "D")   // create an array later to spit out first letter of each name.
        let brenden = Contact(name: "Brenden", phoneNumber: "555-650-5555", firstInitial: "B")
        let jillian = Contact(name: "Jillian", phoneNumber: "555-415-5555", firstInitial: "J")
        let zak = Contact(name: "Zak", firstInitial: "Z")
        let les = Contact(name: "Les", firstInitial: "L")
        
        self.contacts.append(daniele)
        self.contacts.append(brenden)
        self.contacts.append(jillian)
        self.contacts.append(zak)
        self.contacts.append(les)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: Selector(("toggleEdit")))
        navigationItem.leftBarButtonItem = moveButton
        
        // changes the editing property of the table view to the opposite of its current value. If is editing, it is set to false. If it is not editing, it is set to true.
        func toggleEdit() {
            tableView.setEditing(!tableView.isEditing, animated: true)  // .setEditing provides an animation effect.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.contacts.count
        // This means one row per contact.
    }

    // var contacts = ["Brenden", "Danielle", "Jillian", "Les", "Zak" ]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Populates each cell with the name of the contact.
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let contact = self.contacts[indexPath.row]  // A contact is retrieved from the array of contacts by pointing at the index position.
        
        // Check to see if a name is provided, if not, the textLabel will say "No Name". 'contact.name' is pulling from the Contact class which has the optional properties name and phone number.
        if let name = contact.name {
            cell.textLabel?.text = name
        }
        else {
            cell.textLabel?.text = "No Name"

        }
        
        // cell.textLabel?.text = contacts[indexPath.row]

        
        return cell
    }
    

 

    
    // Override to support conditional editing of the table view.
    // DELETING ROWS
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }



    // Override to support editing the table view.
    // Tells the table view which kinds of edits are allowed.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {    // .delete is short for UITableViewEditingStyle.Delete. 
            // Delete the row from the data source
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

  
    // MARK: - Navigation

     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!   // retrieves the indexPath of the selected cell
        
        let contact = self.contacts[indexPath.row]  // retrieve contact object 
        
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destinationViewController as! DetailViewController  // retrieves our DetailViewController from the segue object and use as DetailViewController to access its properties
        
        // Pass the selected object to the new view controller.
        destination.contact = contact   // assigns the contact we retrieved to the contact property of the destination
        
        
    }
 

}
