//
//  TMDBSearchType+BarItem.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

extension TMDBSearchType {
    
    var barIconImage: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    var selectedBarIconImage: UIImage? {
        return UIImage(named: "\(self.rawValue)_filled")
    }
    
}
