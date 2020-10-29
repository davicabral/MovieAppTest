//
//  ElasticHeaderView.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class ElasticHeaderView: UIView {
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Placeholder")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        self.addSubview(view)
        return view
    }()

    private var topConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("IB isn't expected")
    }


    private func setConstraints() {
        topConstraint = image.topAnchor.constraint(equalTo: self.topAnchor)
        NSLayoutConstraint.activate([
            topConstraint,
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.leftAnchor.constraint(equalTo: self.leftAnchor),
            image.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
    }

    func bounce(withOffset offset: CGFloat) {
        self.topConstraint.constant = offset
    }

    func loadImageFromURL(_ url: URL?) {
        self.image.imageFromURL(url)
    }
}
