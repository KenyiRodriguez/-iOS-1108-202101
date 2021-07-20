//
//  MovieDetailViewController.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak private var imgBackgroundMovie: UIImageView!
    @IBOutlet weak private var imgMovie: UIImageView!
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblReleaseDate: UILabel!
    @IBOutlet private var arrayStars: [UIImageView]!
    @IBOutlet weak private var lblOverview: UILabel!
    
    var objMovie: MovieBE!
    
    lazy private var presenter: MovieDetailPresenter = {
       MovieDetailPresenter(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.didAppear()
    }
}

extension MovieDetailViewController {
    
    func setTextContent() {
        
        self.lblName.text = self.objMovie.title
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        self.lblOverview.text = self.objMovie.overview
    }
    
    func downloadImageContent() {
        
        self.imgMovie.layer.cornerRadius = 8
        
        AF.request(self.objMovie.posterURL).responseData { responseData in
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.imgBackgroundMovie.image = image
            self.imgMovie.image = image
            
        }
    }
    
    func setStarsStyle() {

        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index < Int(self.objMovie.average) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
    }
}
