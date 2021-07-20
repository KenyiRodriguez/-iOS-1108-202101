//
//  ListMoviePresenter.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 19/07/21.
//

import UIKit

class ListMoviePresenter {
    
    private weak var controller: ListMovieViewController?
 
    init(controller: ListMovieViewController) {
        self.controller = controller
    }
    
    private func getMovies() {
        
        MovieWS().getMovies { arrayMovies in
            self.controller?.reloadContent(arrayMovies)
        }
    }
}

extension ListMoviePresenter {
    
    func didLoad() {
        
        self.getMovies()
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? MovieBE {
            controller.objMovie = objMovie
        }
    }
}
