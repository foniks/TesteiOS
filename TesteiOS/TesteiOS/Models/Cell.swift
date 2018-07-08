//
//  Cell.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/7/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

struct CellList: Codable {
    let cells: [Cell]
}

extension CellList {
    init() {
        self.cells = []
    }
}

struct Cell: Codable {
    enum CellType: Int {
        case field = 1
        case text = 2
        case image = 3
        case checkbox = 4
        case send = 5
    }
    
    enum FieldType: Int {
        case text = 1
        case telNumber = 2
        case email = 3
    }
    
    // Cell properties
    var id: Int
    var type: Int // CellType
    var message: String
    var fieldType: Int? // FieldType?
    var hidden: Bool
    var topSpacing: Double
    var show: Int?
    var required: Bool
}
