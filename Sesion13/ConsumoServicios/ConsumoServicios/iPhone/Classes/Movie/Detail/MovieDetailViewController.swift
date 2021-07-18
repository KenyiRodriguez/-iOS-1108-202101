//
//  MovieDetailViewController.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imgBackgroundMovie: UIImageView!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet var arrayStars: [UIImageView]!
    @IBOutlet weak var lblOverview: UILabel!
    
    var objMovie: MovieBE!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateData()
    }
    
    func updateData() {
        
        self.imgMovie.layer.cornerRadius = 8
        self.lblName.text = self.objMovie.title
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        self.lblOverview.text = self.objMovie.overview
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index < Int(self.objMovie.average) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        
        AF.request(self.objMovie.posterURL).responseData { responseData in
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.imgBackgroundMovie.image = image
            self.imgMovie.image = image
            
        }
    }
}
