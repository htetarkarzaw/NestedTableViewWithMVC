//
//  ParentVO.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/15/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation

class ParentVO : Codable{
    
    var id : Int?
    var parentName : String?
    var childs : [ChildVO]?
}
