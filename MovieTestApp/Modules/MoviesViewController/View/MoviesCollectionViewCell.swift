//
//  MoviesCollectionViewCell.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupCell(_ viewModel: MovieCollectionCellViewModel) {
        posterImageView.imageFromURL(viewModel.posterImageUrl)
        titleLabel.text = viewModel.title
    }
    
    func setupPlaceholderCell() {
        titleLabel.text = nil
        posterImageView.image = #imageLiteral(resourceName: "Placeholder")
    }

}
