//
//  Colors.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

enum Colors: String {
    
    case app
    
    var color: UIColor {
        guard let color = UIColor(named: rawValue) else {
            fatalError("Color named \(rawValue) doesn't exist")
        }
        return color
    }
}
