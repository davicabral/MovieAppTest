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
    
    private lazy var collectionView: MoviesCollectionView = {
        let collection = MoviesCollectionView()
        collection.register(MoviesCollectionViewCell.self)
        collection.delegate = self
        collection.dataSource = self
        collection.prefetchDataSource = self
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
        
        viewModel?.didLoadMovies = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel?.didUpdateMovies = { [weak self] indexPaths in
            self?.collectionView.reloadItems(at: indexPaths)
        }
        
        viewModel?.didChangeLoadingState = { [weak self] isLoading in
            self?.loadingView.animate(forState: isLoading)
        }
        
        viewModel?.loadMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.delegate = self
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfMovies ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { fatalError() }
        let cell: MoviesCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        if viewModel.isMovieLoading(at: indexPath) {
            cell.setupPlaceholderCell()
        } else {
            let movie = viewModel.movie(from: indexPath)
            let viewModel = MovieCollectionCellViewModel(movie)
            cell.setupCell(viewModel)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel?.movie(from: indexPath)
        print(movie?.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let cellWithMargins = collectionSize.width - 30
        let cellWidth = cellWithMargins/2
        let cellHeight = cellWithMargins * 0.8 //aspect ratio
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // Request Pagination
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let viewModel = viewModel else { return }
        if indexPaths.contains(where: viewModel.isMovieLoading), !viewModel.isLoading {
            viewModel.loadMoreMovies()
        }
    }
}

extension MoviesViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == self.tabBarItem.tag {
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}
