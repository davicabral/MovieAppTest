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
        self.commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.activityIndicatorView = UIActivityIndicatorView(style: .large)
        self.activityIndicatorView.color = .white
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.startAnimating()
        self.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            self.activityIndicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.activityIndicatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.activityIndicatorView.topAnchor.constraint(equalTo: self.topAnchor),
            self.activityIndicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width/4
    }
    
    func animate(forState state: Bool) {
        self.isHidden.toggle()
        self.isHidden ? self.activityIndicatorView.startAnimating() : self.activityIndicatorView.stopAnimating()
    }
}
