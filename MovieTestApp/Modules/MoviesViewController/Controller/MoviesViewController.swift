//
//  MoviesViewController.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class MoviesViewController: UIViewController {

    var viewModel: MoviesViewModelProtocol?
    
    private lazy var loadingView: LoadingView = {
        let loading = LoadingView()
        view.addSubview(loading)
        loading.animate(forState: true)
        return loading
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        let nib = UINib(nibName: "MoviesCollectionViewCell", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: "movie")
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.addSubview(collection)
        return collection
    }()
    
    convenience init(viewModel: MoviesViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.title = viewModel.title
        self.tabBarItem.image = viewModel.barIcon
        self.tabBarItem.selectedImage = viewModel.barIconFilled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            loadingView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 80),
            loadingView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 10 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as? MoviesCollectionViewCell else {
            fatalError()
        }
        
        cell.posterImageView.image = UIImage(named: "Placeholder")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let cellWithMargins = collectionSize.width - 30
        let cellWidth = cellWithMargins/2
        let cellHeight = cellWithMargins * 0.9 //aspect ratio
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    
}
