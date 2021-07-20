//
//  MovieDetailPresenter.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 19/07/21.
//

import UIKit

class MovieDetailPresenter {
    
    private weak var controller: MovieDetailViewController?
    
    init(controller: MovieDetailViewController) {
        self.controller = controller
    }
    
    func didLoad() {
        self.controller?.setTextContent()
        self.controller?.downloadImageContent()
    }
    
    func didAppear() {
        self.controller?.setStarsStyle()
    }
}
