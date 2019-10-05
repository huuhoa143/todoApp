//
//  Item.swift
//  TodoApp
//
//  Created by Bingxu on 9/28/19.
//  Copyright © 2019 Bingxu. All rights reserved.
//

import UIKit

class Item {
    
    //MARK: Properties

    var lable: String
    var time: String
    var date: String
    
    //MARK: Initialization
    init?(lable: String, time: String, date: String) {
        if lable.isEmpty || time.isEmpty || date.isEmpty {
            return nil
        }
        
        self.lable = lable
        self.time = time
        self.date = date
    }
}
