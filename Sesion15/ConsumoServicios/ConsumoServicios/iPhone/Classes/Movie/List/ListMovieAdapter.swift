//
//  ListMovieAdapter.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 19/07/21.
//

import UIKit

class ListMovieAdapter: NSObject {
    
    private weak var controller: ListMovieViewController?
    
    var arrayMovies = [MovieBE]()
    
    init(controller: ListMovieViewController) {
        self.controller = controller
    }
    
    func initAdapter() {
        self.controller?.getClvMovies.delegate = self
        self.controller?.getClvMovies.dataSource = self
    }
}

extension ListMovieAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.objMovie = self.arrayMovies[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}

extension ListMovieAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller?.goToDetail(objMovie)
    }
}

extension ListMovieAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width           = collectionView.frame.width
        let spaceCell       : CGFloat = 11
        let paddingLeft     : CGFloat = 10
        let paddingRight    : CGFloat = 10
        let numberOfColumns : CGFloat = 2
        
        let totalSpaceCell  = spaceCell * (numberOfColumns - 1)
        let availableSpace  = width - (totalSpaceCell + paddingLeft + paddingRight)
        let cellWidth       = availableSpace / numberOfColumns
        let cellHeight      = cellWidth * 1.8
        
        let newSize = CGSize(width: cellWidth, height: cellHeight)
        return newSize
    }
}
