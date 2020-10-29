//
//  MovieDetailsViewController.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(content)
        return content
    }()
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.imageFromURL(viewModel?.posterUrl)
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var backdropImage: ElasticHeaderView = {
        let header = ElasticHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.loadImageFromURL(viewModel?.backdropUrl)
        contentView.insertSubview(header, at: 0)
        return header
    }()
    
    private lazy var overviewLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = viewModel?.overview
        contentView.addSubview(label)
        return label
    }()
    
    private var posterViewTopConstraint: NSLayoutConstraint?
    
    private var viewModel: MovieDetailsViewModelProtocol?
    
    convenience init(viewModel: MovieDetailsViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = viewModel?.title
        
        posterViewTopConstraint = posterView.topAnchor.constraint(equalTo: backdropImage.bottomAnchor, constant: -100)
        
        let contentViewHeighAnchor = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        contentViewHeighAnchor.priority = .defaultLow
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentViewHeighAnchor,
            
            backdropImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backdropImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backdropImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backdropImage.heightAnchor.constraint(equalToConstant: 250),
            
            posterViewTopConstraint!,
            posterView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            posterView.heightAnchor.constraint(equalTo: posterView.widthAnchor, multiplier: 0.9),
            posterView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            overviewLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            overviewLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: 16)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if posterView.frame.height > 0 {        
            posterViewTopConstraint?.constant = -posterView.frame.height/2
        }
    }
}

extension MovieDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            backdropImage.bounce(withOffset: scrollView.contentOffset.y)
        } else {
            backdropImage.bounce(withOffset: 0)
        }
        
        var offset = scrollView.contentOffset.y / 50
        if offset > 1 { offset = 1 }
        else if offset < 0 { offset = 0 }

    }
}
