//
//  LoadingView.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class LoadingView: UIView {

    private var activityIndicatorView: UIActivityIndicatorView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            activityIndicatorView.topAnchor.constraint(equalTo: self.topAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width/4
    }
    
    func animate(forState state: Bool) {
        isHidden = !state
        isHidden ? self.activityIndicatorView.stopAnimating() : self.activityIndicatorView.startAnimating()
    }
}
