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
        return loading
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MoviesCollectionViewCell.self)
        collection.delegate = self
        collection.dataSource = self
        collection.prefetchDataSource = self
        collection.backgroundColor = .clear
        collection.contentInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
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
        
        viewModel?.didMoviesUpdated = { [weak self] movies in
            self?.collectionView.reloadData()
        }
        
        viewModel?.didChangeLoadingState = { [weak self] isLoading in
            self?.loadingView.animate(forState: isLoading)
        }
        
        viewModel?.loadMovies()
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
   
    // Request Pagination
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let viewModel = viewModel else { return }
        if indexPaths.contains(where: viewModel.isMovieLoading), !viewModel.isLoading {
            viewModel.loadMoreMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfMovies ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { fatalError() }
        let cell: MoviesCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        if viewModel.isMovieLoading(at: indexPath) {
            cell.posterImageView.image = UIImage(named: "Placeholder")
        } else {
            let movie = viewModel.movie(from: indexPath)
            let posterUrl = movie.posterImage(withSize: .w185)
            cell.posterImageView.imageFromURL(posterUrl)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let cellWithMargins = collectionSize.width - 30
        let cellWidth = cellWithMargins/2
        let cellHeight = cellWithMargins * 0.8 //aspect ratio
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    
}
