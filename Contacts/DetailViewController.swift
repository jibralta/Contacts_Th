//
//  DetailViewController.swift
//  Contacts
//
//  Created by Gladys Umali on 8/1/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!

    @IBOutlet var phoneNumberLabel: UILabel!
    
    @IBOutlet var firstInitialLabel: UILabel!
    
    var contact: Contact?   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Check first if the properties have values by using optional variables in the model class and checking them with if-lets
        if let contact = self.contact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
            if let phoneNumber = contact.phoneNumber {
                self.phoneNumberLabel.text = phoneNumber
            }
            if let firstInitial = contact.firstInitial {
                self.firstInitialLabel.text = firstInitial
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
