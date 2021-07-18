//
//  ListMovieViewController.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    @IBOutlet weak var clvMovies: UICollectionView!
    
    var arrayMovies = [MovieBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies()
    }
    
    func getMovies() {
        
        MovieWS().getMovies { arrayMovies in
            self.arrayMovies = arrayMovies
            self.clvMovies.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? MovieBE {
            controller.objMovie = objMovie
        }
    }
}

extension ListMovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.objMovie = self.arrayMovies[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}

extension ListMovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let objPlace = self.arrayMovies[indexPath.row]
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objPlace)
    }
}

extension ListMovieViewController: UICollectionViewDelegateFlowLayout {
    
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
