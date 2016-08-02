//
//  Contact.swift
//  Contacts
//
//  Created by Gladys Umali on 8/1/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit

class Contact: NSObject {
    
    var name: String?
    var phoneNumber: String?
    var firstInitial: String?
    
    // since these are optionals, not required to create initializer function. But added below anyways...
    init(name: String? = nil, phoneNumber: String? = nil, firstInitial: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.firstInitial = firstInitial
        super.init()
    }
    

}
