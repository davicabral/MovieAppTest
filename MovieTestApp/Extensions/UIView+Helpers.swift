//
//  UIView+Helpers.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}
protocol NibLoadableView: ReusableView {
    static var nibName: String { get }
    static func asNib() -> UINib
}

/*Implements obrigatory reuse identifiers from class name to views that
 conform to this protocol */
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return reuseIdentifier
    }
    
    static func asNib() -> UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
}
