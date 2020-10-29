//
//  UIImageView+Nuke.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import Foundation
import Nuke

extension UIImageView {

    func imageFromURL(_ url: URL?) {
        
        if let posterURL = url {
            Nuke.loadImage(with: posterURL, into: self)
        } else {
            self.image = #imageLiteral(resourceName: "Placeholder")
        }
    }
}
