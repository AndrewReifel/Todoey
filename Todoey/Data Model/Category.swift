//
//  Category.swift
//  Todoey
//
//  Created by Andrew Reifel on 5/25/19.
//  Copyright © 2019 Andrew Reifel. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}

