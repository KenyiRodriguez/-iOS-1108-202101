//
//  ListMovieViewController.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    @IBOutlet weak private var clvMovies: UICollectionView!
    
    var getClvMovies: UICollectionView { self.clvMovies }
    
    lazy private var presenter: ListMoviePresenter = {
        ListMoviePresenter(controller: self)
    }()
    
    lazy private var adapter: ListMovieAdapter = {
       ListMovieAdapter(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
        self.adapter.initAdapter()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.prepare(for: segue, sender: sender)
    }
}

extension ListMovieViewController {
        
    func reloadContent(_ arrayMovies: [MovieBE]) {
        self.adapter.arrayMovies = arrayMovies
        self.clvMovies.reloadData()
    }
    
    func goToDetail(_ objMovie: MovieBE) {
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
}
