//
//  UICollectionView+Dequeue.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

extension UICollectionViewCell : NibLoadableView {}

extension UICollectionView {
    //Register cell from class reference
    func register(_ cell: UICollectionViewCell.Type) {
        let nib = UINib(nibName: cell.nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    //Dequeue cell from class reference
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not find cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
